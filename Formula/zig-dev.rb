class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "22eb6446afa8078ffd5dfc32d197fdad43ec79eb159a85a332ddb9bea201d0bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c18dea56ea38b2cfdb7e951e549311b5764e7b80c37b25de0cec039bf2033add" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "71a6efddeee5ae5657b4e0cc61a722975ff13cf4d81780e3e83522a94ad0d1c2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3074+ae7f3fc36.tar.xz"
  version "0.12.0-dev.3074+ae7f3fc36"
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
