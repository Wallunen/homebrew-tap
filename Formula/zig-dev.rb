class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5f5a8e935c46740a444d351ef11cd24c323069a3751c60dbdb56c04c99f544a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c8f04e4ad046b448c2a12edfb1db7d3b515d6dfca1d2bbc2d52e9a4506a0738" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2490ec1cea45cbea88292947332651882d4c8a9b7dcdc19e63faca6229e7de02" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3667+77abd3a96.tar.xz"
  version "0.12.0-dev.3667+77abd3a96"
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
