class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260602-115940"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bbb808338151d4204601ff556bd1b5d9c6a93d8e83c3d7a741e922e523ec3970"
    sha256 cellar: :any_skip_relocation, sequoia:      "0475b7e475947ae19ffefb28db176da41c1e0c20e28ec2a6726ee50a35add55a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e268d1c216e5f75ef97f2a080afa2da54f4e73b2b65b9c65c33ae2d39852b0ac"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6265f0e9b675f86a4777b009c1f79f9774ae09626ace82238f27fe6e1baa460f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "70a4eaa012db117e2388635bb2b7f8c17c2e6cd0fca4ad9fbb1b6ae1d16d9067" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f420613201cdcd7678356099f0cd76ce511931db61eeb1f2a6d9a156316aea2a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.657+2faf8debf.tar.xz"
  version "0.17.0-dev.657+2faf8debf"
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
