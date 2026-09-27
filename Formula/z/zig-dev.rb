class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260927-132835"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6a78df174da3eb30430b8a492ead8398006d67d823da2401fcd2700e88fe90de"
    sha256 cellar: :any_skip_relocation, sequoia:      "ccb517b07e3fc1b9618bd06bd69017e40a92bc5076a779747ac1fc355044c0fc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "46ddef77f0ecd0fcd96f21f17c5718255a4d464256810d754917399cdcfef110"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4cbf1a9e7d1c5d21f519e49ea4da833b5a0368c9edd98e3351732d9ed7c56597" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e2abc63ea4db5df046aa3088e1b660faca39c83da3bda544c734c65af5365c9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0ea7a4b858eb11cb738add922803eb228a915cdb2f8992e78787e564d54761bd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2313+5b9147ed5.tar.xz"
  version "0.17.0-dev.2313+5b9147ed5"
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
