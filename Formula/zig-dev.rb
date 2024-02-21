class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "659b0f51ded173636e96028f4efa070a44b00240aaf3aff2f42597ff2b8e6317" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3e7dc05a6eddc157885da0bcaafcb3818260b276b43e1e49248e13f5deb57b9d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f8f60db975a20e3a4b48838d6fb45c43404681a075523b65380df51eca1866a2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2819+65a87ff29.tar.xz"
  version "0.12.0-dev.2819+65a87ff29"
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
