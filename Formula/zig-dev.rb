class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "50a319c5c271ea4a8438b2238ec200e975bc0c809b663b10824d1619dbaeb843" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a95ab3071b65426867c55792db566c986ff3e6a127525ded52a9efa8a02d244b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "10d8d5c73e3953ac5f73fb8fe7d50a2921b6fb7219e015b628b319d5a98268f2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3064+d761e6cc7.tar.xz"
  version "0.11.0-dev.3064+d761e6cc7"
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
