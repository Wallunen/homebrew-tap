class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2ad99f2403efeeff0d78f7de17f641cf3949c5b793b5847e0c061b162a7bbbe7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7762bbf2bdfd4f214061d1a2f850472f217a7f504422222e50233be04efb3e08" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1464233bae2a4cbfe0efc0b5cc56ae7c36586ff174ad18c028475c42259b2e2d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2194+626a75bbc.tar.xz"
  version "0.11.0-dev.2194+626a75bbc"
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
