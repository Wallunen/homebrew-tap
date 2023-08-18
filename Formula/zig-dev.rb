class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6ee419595497fb28154a643fc16947ac4f4c116df061b61996b80f676487fbc2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bc628e25718c25f022ed0a1fe92c6a265ffedd10093ae364f978e5a8d3d7234b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "01ca9799e0da1bd01807d1f5f270674ebfb8f2dfc9a600eb05dd2bd0d1738e7f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.108+5395c2786.tar.xz"
  version "0.12.0-dev.108+5395c2786"
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
