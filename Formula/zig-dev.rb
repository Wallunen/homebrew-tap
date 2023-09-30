class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e3e6343a0bed96f2f3c4596f6a874424d5c3204f9f87de3f88d4261cf7f293a6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "97b9bc78114cae121fa35f1d2621935943908b49c028c4a1d335f56e1ebe4bbc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "afd0ff5319303b3ceca8b7d408ffef899029b1c863ca9af8a913637290785dd2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.668+c07d6e4c1.tar.xz"
  version "0.12.0-dev.668+c07d6e4c1"
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
