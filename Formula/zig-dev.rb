class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3e2fc9540b6caf50966e2c3bb458de1606de3d89d013fede90e37a6469f73287" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "05fd71e2fadec775f7c39145564cdbdd2074a5178734cbb3ebb98e34fb4b3655" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fed51f967a61a6ceea083922650c81a999ccb77728dfb03957a7e396bd62e48c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4308+417b92f08.tar.xz"
  version "0.11.0-dev.4308+417b92f08"
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
