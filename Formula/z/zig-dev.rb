class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "53a70b06f969d8a8e7c6a5f8bbf923aa765c43851d2fa758a8d848f717c9373f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e92683dde83b32d225703bd213358c740d1784a7c35946384bc3c31d2e4db963" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5f2267ac818090424f98b3385e87215e20ad2fa14de1d84fbc242f71d1a3a15b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2261+fbcb00fbb.tar.xz"
  version "0.14.0-dev.2261+fbcb00fbb"
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
