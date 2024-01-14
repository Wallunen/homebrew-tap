class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3a45889a7a52888e964539420848e52c8d0b7a69e4d15a28e5e87bdf91db5498" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b97628ac26ddc15e420f012c980c5c31ee768dc4f19001f003547a1930c996b0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d47b65e0a685ff76cbe8d0188513d02acad6ebfeda37456b51983f60343a66ff" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2158+4f2009de1.tar.xz"
  version "0.12.0-dev.2158+4f2009de1"
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
