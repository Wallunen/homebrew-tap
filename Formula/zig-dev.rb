class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "df2ee9b41a22b5d2f61ae57beb803b28e68d6940b7118f0e120853c00f5d06c5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0977ea58ec56226c0931a1e6b1996006bbcfa8e4e801521a461aea24090d6f4e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8a855641e9345246a766e900074a91f33233e392ba841c6085a1f0c3b6c4478b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.573+c9413a880.tar.xz"
  version "0.12.0-dev.573+c9413a880"
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
