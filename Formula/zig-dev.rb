class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6b8e7b37386104ccb51fe694450e680eb6fb745124dbbed71f0e9cf645e85378" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6169136246ce94eb0200ccfba915932b17e0f9c194ff77d8b554ba21d3985bb9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cc82b5c700833a418551614291691c75d596921f915cc62407bdbdf7e8d145f1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3043+00ff123b1.tar.xz"
  version "0.12.0-dev.3043+00ff123b1"
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
