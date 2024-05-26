class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3ec7ea8f73a61d7318f8140fa7827cfcba9ceaae17ff1f98a3320ed05065309f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "edd3cdf8e7ecb8979fee6ee2b09146b81d4d28685f34569a51b9537508905185" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4151bc31903d9bb9c5b6abd050a65da3564abc0d972b7f023fa2f84c7c1d2c66" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.267+793f820b3.tar.xz"
  version "0.13.0-dev.267+793f820b3"
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
