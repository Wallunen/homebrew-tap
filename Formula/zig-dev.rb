class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "67c301b0c9a4e135f3429799150fd0ae2f07f6e992f5b0150412d8f72785964d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6956f55116a70bcf395ef4f983a0d6593694e381ce654a33ebee7c84179e1a65" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "66e13eeedf34140dbe27f58a8dfdf5563d0b72e07fcfb3fc60df04318baa24a3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.26+d34201c84.tar.xz"
  version "0.12.0-dev.26+d34201c84"
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
