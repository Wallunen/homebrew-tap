class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3f9ef06e40900f950e3de76103145362f2b1036057ba14009c9354fa0da897d1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "af083a5ecfb80486753cf7b2c36248cb74323442ef069e3d6d36b1e0131471da" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2782920a3125a88b3b6871412df99581470d2ad83ff08e17ec6f3c499d28dd00" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.701+d8bfbbbf2.tar.xz"
  version "0.12.0-dev.701+d8bfbbbf2"
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
