class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "710e116b8530a727fd4df24689e12f01fb63ec627837e3cdb68536dcb02b2a7b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b186b499e02c7d121486b7330d249bbcf1c2d286059cddde613f83293ae0f90e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dc60a8f3f636ed8e55dfc8f98c2804b063b68d48333c784a386bb946c9b860a4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2850+0ead0beb8.tar.xz"
  version "0.14.0-dev.2850+0ead0beb8"
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
