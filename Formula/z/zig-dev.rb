class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f30fcd36454649c9804dcfb747d6f7d7c4a164bf64574422585c71679569c482" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "23ae9857a07cb440c7d8cd570d2e2138c9b8d75ab1eae85520a5615c42be4906" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d602454c656167912f3d9eec1da786819297fd5f1f52d852bfc8440f466ba05c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2218+862266514.tar.xz"
  version "0.14.0-dev.2218+862266514"
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
