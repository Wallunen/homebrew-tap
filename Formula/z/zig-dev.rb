class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "71609fe2c26f9e8f73b769e86bc2f822a12b9b040c9b3b001cb86de3bf3000d5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0feaa0ca91f2aaee6cc6bbdc3cad49c2d50ebbe88e23d143c3b5ee6e6197e906" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "220faef22c1789fbe77a5555ea1d2e7be8a399fac417ac61b09320a7d7bf8e56" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2435+7575f2121.tar.xz"
  version "0.14.0-dev.2435+7575f2121"
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
