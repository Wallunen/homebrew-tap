class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c3d472ccc1bdf049e3c7e8a3ac68a90e682728ba64e495358ce16e2682ffc672" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e7a39e1e4ba673541df2bd8f592ed3a3f6c9cca725ca9ef40a70ae47c0456231" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e11e6c3b17da4e77a8feae906adfbbfcfec5b8deb3c9f5c085efff21b9c182ae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.107+000aa3008.tar.xz"
  version "0.12.0-dev.107+000aa3008"
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
