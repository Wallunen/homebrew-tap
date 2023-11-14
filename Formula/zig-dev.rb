class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a2bd65f2a389c698ac29e245e6b6068f7f0a0c34d39bad97cec2ee59425729e3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "22ab161230603f15c5732b11d3b73075017a0bc4d4a3da316aa66b1b5d7130dd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d83a8b11032d6af685db16622320213c008fcc68b3b7b6af2e0259146486475" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1604+caae40c21.tar.xz"
  version "0.12.0-dev.1604+caae40c21"
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
