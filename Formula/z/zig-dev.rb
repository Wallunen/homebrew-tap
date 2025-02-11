class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "64b2ce7347fcb4cd9e9bed865785fb4a44003992e771b16d6691c3d8728050bb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a5cb1573307c78010354ebd74bd0b81f6d6b99058d3f97f620665490ff5a4058" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9db07df6dd83c338ccdd2a9b80780e785db019d1fdfc83078a0d89495287c0cd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3187+d4c85079c.tar.xz"
  version "0.14.0-dev.3187+d4c85079c"
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
