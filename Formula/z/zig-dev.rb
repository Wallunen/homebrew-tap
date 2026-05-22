class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260522-174737"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b8dcab4b15d6fb1022c8248fc356799b2343cb33938822e51b0cca200b16f409"
    sha256 cellar: :any_skip_relocation, sequoia:      "ffcf66f9dc5964dce74c75963ab33c119b35cd0f904c8e4ae81d1b452eb8f665"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2ce3411a5d82274c9c7e0004079b2c9369f1cd3efa62da82d40d4f4e377dd2f8"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "00d02a325fef53cb2a648dcec9efcbf83836f2cd21fd6697d8c8595113e7a03b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe473aef6060246d19b7f559a0bcb2164e975b76029367fd917b6bfda12baf43" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "42895dc4ae376220da34e647a7f73b04f55baecebe20f292e77ccc2c5a2008f7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.329+21b7ceb5e.tar.xz"
  version "0.17.0-dev.329+21b7ceb5e"
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
