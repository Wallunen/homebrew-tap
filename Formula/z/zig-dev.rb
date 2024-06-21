class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9d905cc915e2f0047b770316ce73dbd723a44e2dd83501b0dbcf8f8f4bbee69a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eb8af7e693c3baca91f124f2de78bcafef396f7722774e8f330886a8fb1554aa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "20795004e65b9ce2d8ddda517df0d1028ec3ce595410bdfae393f7c6bb77534e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.105+f7d72ce88.tar.xz"
  version "0.14.0-dev.105+f7d72ce88"
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
