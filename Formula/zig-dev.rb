class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "31d71665d60743a161f04bd7586b6aa94df24e30f4b5a496f6fdaae1ce2d7812" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ad2a84e844cee4b566a0981749a886c7765fc538673978db2b4e4de01db3aff8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "715512f69317dfa68ca1d51d539a732244c67f1a68ff0100d77a16df846a1750" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.98+3e228bdf4.tar.xz"
  version "0.12.0-dev.98+3e228bdf4"
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
