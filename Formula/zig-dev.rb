class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "336dadf847a97da6920de2ac41122a9b707f54553ccbb80086b7522681619477" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1fe6149c5dc9cfb97855bee692eeb412f363ba2cfa879b30326303766120e7bd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6962ef4023775b0bdaeac44805349b70f7769bd0fc2aa2c1bfd32e0d376e8c08" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1835+697b8f7d2.tar.xz"
  version "0.12.0-dev.1835+697b8f7d2"
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
