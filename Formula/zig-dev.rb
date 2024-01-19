class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1c512f1a10c23ee5b148630938dc2282f42b8dc02123979bb3795f81787d39d6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c9fd2b40f3dc9daa88dcc54ddc2d887e7edcc88b3e0705ed420347ebccb18a2a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "365c0dfa62921b8e760d24b050c3d29f9ba1887a957a2bf292c9028ccd68be21" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2278+7d81c952d.tar.xz"
  version "0.12.0-dev.2278+7d81c952d"
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
