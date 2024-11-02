class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f4a1315a623d0f1ea60bd37e99bc9c2fd4661968dd27d982e6f2508d0e432624" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "994be21c11dc34a11b0854c6e467115dc52bf071930fbc6bdfa5eb6d1bf317c2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e25638888daaacaacb15d1922382ab93183aff3772f3d5b7ccd7e35a893e912f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2106+ab89af3d3.tar.xz"
  version "0.14.0-dev.2106+ab89af3d3"
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
