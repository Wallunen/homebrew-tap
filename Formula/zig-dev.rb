class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "47ad318a1075d0db08cf7675baee43f73dc0ddc35605a84a02b734aa47398369" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43053fa4e91162ccd18ae002f190c976cd56caa16aaf10e362bba4149d9d923b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1d56e4e88a1818820264b12f8f2abce3949e6a9a0115c1132f5907cd0ac880ae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2540+776cd673f.tar.xz"
  version "0.12.0-dev.2540+776cd673f"
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
