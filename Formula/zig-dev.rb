class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e8641bea8a07e70d4b5b457b5cc2ad609a0206c0cbf4234b7d27d3ea94e43cfa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2a34159fba27497f79d114509dcec179d09648f5cad907e58a09fdb63b5fc24c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d90ca4a020a63d1535e227739c9174d3c57e3cef5880f7bc968560487360a95c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3853+cc2daae47.tar.xz"
  version "0.11.0-dev.3853+cc2daae47"
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
