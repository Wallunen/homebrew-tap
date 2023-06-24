class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "095694fac3a2d9287bc7c46140cb2cb951623096551ea91c383c2c24ec65db48" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5e3ff55b44f895932c5cd344cb4a734c733281e2397c5b7b1f9ae40ef70da825" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2e4bcbdf03423f65edb811d02aabcef7bcdd966002492c92c95a0ba8163331d4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3786+8dcb4a3dc.tar.xz"
  version "0.11.0-dev.3786+8dcb4a3dc"
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
