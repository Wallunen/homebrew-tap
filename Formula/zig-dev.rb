class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "032b9c2fe814ab94379aeafcab226e254b6fb731c1dad26c27769d54256ad99f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e49fec25d1d34908ccbc26faa244bfb88390938bd2d2474a6b0d64530efdbc90" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe09e0e55558a89a2bb2c312b0c60827f2cf250df53a85b023f8efdbc0842fcf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1797+d3c9bfada.tar.xz"
  version "0.11.0-dev.1797+d3c9bfada"
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
