class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3f7e7affe9222af71e32066623235ae3c0a61630354d99b929533ee6a4d9b63d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e7f55cc1c8160c9750a9dc284928ae85506cbf53a80f489f7f0f2a58a0b76302" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3881fdd66e4d0cc885460844a9fab6216ebe58c7ef90ad22efe10245ed7c1767" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1586+41330c96a.tar.xz"
  version "0.14.0-dev.1586+41330c96a"
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
