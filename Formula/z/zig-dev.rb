class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-e584307a"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "62e63818851d017b46c45477bc5dbd294aabbc0a605dd53059a130dd430ebbec"
    sha256 cellar: :any_skip_relocation, sequoia:      "650dc2cf078d02e17a6d790e1a0e00f66260e21b55a5dc51eccb07a5e127ca91"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f37b0c0ecce4016a300ef16bcbe0b871e76dd0659619270da8df4e719e527cb2"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "94233317d2712d0071878411bf8faae141768e337691ffcd45cce883858275a1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18febab30e3c65fef6c2ea80e339668e2d0b17a303ea7e3dd7368af139142e11" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "08cf4ad6487d59bfca56f5c2cb1ac8f02e17d11fcf725b905b752682d6674071" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3028+a85495ca2.tar.xz"
  version "0.16.0-dev.3028+a85495ca2"
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
