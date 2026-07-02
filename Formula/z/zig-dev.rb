class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260629-122643"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "18940f4761edcf653a19fa713b784dcdae780e4838799d1787234114563b1756"
    sha256 cellar: :any_skip_relocation, sequoia:      "973ba92d330b333956d198e68824ee91860fa3fd18d5dbdc609132e7718b738d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5b82a6258241059e7b50096b1f0a4133f1aa23c45f23782442717f9317e55010"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "511fadf165623683419429e9d37a49284c9929db3b2746a0c1fa2bb3dae306e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6cbe8b5f233e3794e440c76ae565c88fa9f12e394106d8a34dbcbe2d659eb2bc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e5ff2fce71cb195dff6242b4f136df3ee18a7e456ba5333c0216cb59e37634eb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1158+1d1193aa7.tar.xz"
  version "0.17.0-dev.1158+1d1193aa7"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
