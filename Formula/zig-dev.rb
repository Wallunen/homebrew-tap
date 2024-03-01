class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "41f15f9196d0a34580ec6b0460a30b2b78b97ad71e304d3ea209702245d08648" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7465d2f0e51beee6bd43ea77abeac3db2b9e317b31422761e3507a5eeacba74a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e5e2f34d128488a96201d2c6efbcb73d2c09dc126d93a1721f8bcf7b846fffc8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3097+5c0766b6c.tar.xz"
  version "0.12.0-dev.3097+5c0766b6c"
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
