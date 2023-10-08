class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "33119a804183ce3c8bf0c3d33f63a69841223965480e317a16ff8af86635d981" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4208ea6d2d6c10beb58266ff5c854e628ae61289980bfcc09847660abd5dc3cf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e536951ba952600a96801904888f94385eb005e60710788309f38a717356a5c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.799+d68f39b54.tar.xz"
  version "0.12.0-dev.799+d68f39b54"
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
