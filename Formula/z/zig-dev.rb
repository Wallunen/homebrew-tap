class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "56052b29a09f0b23ebd55fa9ec97f43b4de099631725d9b410077709641285ea" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "40ecb06f79990e9ed3ce2c6d349b2fec5d6e88aba688b1c2a7735b30d21acf71" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dd66c1e81ae4a977dfb0ac4415f0d23ba49c685715ada08ff022abdc1c9833fc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2458+10282eae6.tar.xz"
  version "0.14.0-dev.2458+10282eae6"
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
