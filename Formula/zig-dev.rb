class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "38fdfba851582428e00780562546fbc2f9c4aba71d24fa7f1c5999ca6f0936ca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "45b2239f738fc213fcb6bfb142cfb1469cd91ce95a06ecae0527eed0805e9515" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "46a2456c9c5bcf1dd40c086d5963eccb1d453f5f75cc2386c7be2b0449ccc3b6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3275+eef92753c.tar.xz"
  version "0.11.0-dev.3275+eef92753c"
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
