class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ad6427f3f34aa9a53ebce0e50413dc8efbce69c7ec5c5d5a48cfbc656a96b839" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9810c00d65a0b400ad605163fb7b77e7371b09bc38a3c4a71fe709a36e6b695b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8660c3fd76219f846adc0d68ba44d420f1776922d4977b8e88b8e6ba6489c803" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2639+15fe99957.tar.xz"
  version "0.14.0-dev.2639+15fe99957"
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
