class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a6b0cc74ff7b784aeeedf7b038be21ce8791e14afe78bd5cc216f5569be169aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4b4d49ea161c74e3e93da81879c7d7ce99c94b8cfe346145277e65805ec397e2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3f0bab3648872adc15bfe050e81fdd6f95ea81eaa243481b5cc385cde2eb7475" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.817+54e7f58fc.tar.xz"
  version "0.12.0-dev.817+54e7f58fc"
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
