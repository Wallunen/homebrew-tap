class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ab7fed8bfa428ac952dd4f3c3c1727e614f08882d5a1fa96fac9eeaffddef63d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e24a998251d6dccf366545f1948fb3b222f8358b01da212c1af5092e3c1d8ca" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9bc9cb1276e615c055700940cfcb3b726000d866c2d7d0a08bcc6662c6a076f0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.781+f03d54f06.tar.xz"
  version "0.14.0-dev.781+f03d54f06"
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
