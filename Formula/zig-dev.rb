class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "81c7b0abc5901d3e819995d28906d000528d87fa127db020f910114688292112" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f2515b671949a6a7bb75d8fc75c0c2f38b41f8ea7943b263753cdfca8711c94" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "435566a697b8b0c32ec0d330b3c5f43b99e46fc0126b326594db659d8c0747cf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.378+4f952c7e0.tar.xz"
  version "0.12.0-dev.378+4f952c7e0"
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
