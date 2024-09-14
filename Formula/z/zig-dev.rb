class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "974241d3aa2650a33584c78d66e489099c9ffaa8a77b6ca377a9b91ee8d53006" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fef3e74002f4382d61236f8dc4f0ea1abf8818603abd04fb3a540d4bdac2e0b0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "92082abb5e2dbef2a00b56dfbb4f8093b205772e4cc7ab36f15359cb60efa58d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1569+b56a667ec.tar.xz"
  version "0.14.0-dev.1569+b56a667ec"
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
