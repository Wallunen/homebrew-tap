class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "22c4e131785c8d94b7342a07c7ae93c5624b3a220bfc514baa89e4ed717238f6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43900f05712e50398face0b258c747cf39240f3ba281147436b995b848f0abbf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7d4412976e0dc12720b577b67674159fc15d2a97c5462fed490d6101fc66a24e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2985+3f3b1a680.tar.xz"
  version "0.11.0-dev.2985+3f3b1a680"
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
