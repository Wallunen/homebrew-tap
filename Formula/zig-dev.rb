class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "31ad5bcd1ccdda155c62cae733c301b4bf8703259f6a841fa3480efee18aa492" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f5f787884751717929cbaa59ba332bb47f6a24f973498c9816b2700c71383790" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6ade192e46e2040c95325c3f621f227b78609d1a9c929741f7b613452de94052" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.66+5e0107fbc.tar.xz"
  version "0.12.0-dev.66+5e0107fbc"
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
