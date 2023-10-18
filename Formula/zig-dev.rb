class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ed6fb3e20b92c2f12c3811ef7232a96eb7622dff8f8c23344b23d27551f6ea93" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d97f0477360c3bbbda1f9a5baf66b98281cd6f9c915a31fc8958c58126831df1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3bb544fc3aeb45371da9086cbb846b011f4bfcb8ea02cd475b5587a8c016efd6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.986+0b8fca5a1.tar.xz"
  version "0.12.0-dev.986+0b8fca5a1"
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
