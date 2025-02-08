class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "603852c8b327836b648a2aebc49b284e17d85a24b5977da93d052e10567177be" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7c8a0f6b910b8ca2c750fad9c774d1194da3144ae89b04038b88304ff32311da" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3820442a7251224d6406ad62538089fb88807c97b43028205254819bc604d9b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3086+b3c63e5de.tar.xz"
  version "0.14.0-dev.3086+b3c63e5de"
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
