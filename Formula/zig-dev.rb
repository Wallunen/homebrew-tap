class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dbf4ec9a3e328737b0be070c4cdcda4300b6e978c715b2c1c28c2089c8836aaf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c60fbc9d66d8d473c07573a001fb122b1348ea469625a27a31050b3b47c650e3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5473944947b815782ed480eb5f7701b71236ce6f015b41865dc103524a6f0612" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.32+4aa15440c.tar.xz"
  version "0.14.0-dev.32+4aa15440c"
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
