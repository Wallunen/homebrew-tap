class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0b477f3660bec9902a223a5c6860ed1643b9127545c3704c369ec506ad991aac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d95dbc08c736dca438b4579abc9828d350f5fec1051013648a6ce1c0ec1a1b53" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7774e02ffc53f86be4eecbcc9100d7c31d4f589b18e00693ab3d8f59826a5a95" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1264+d1230842a.tar.xz"
  version "0.12.0-dev.1264+d1230842a"
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
