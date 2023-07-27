class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "faf83556031c0337b879e1601dc8720d2cd8b7650473e93a6d3b930c97fc6f4b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6db65554860260a6209c9134c7fe3a02062bbcc467e088104c503f5edd8370ba" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ff35d80737d902c3adffdf146242455622996176cf0444b59bb101de1058b196" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4252+6cee98eb3.tar.xz"
  version "0.11.0-dev.4252+6cee98eb3"
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
