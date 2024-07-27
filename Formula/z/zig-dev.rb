class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "10d43f603485867dd946b4027ef247e148c56b711038a564866fa9fb9a8b48cc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6d4726a5730f38529f82c5bbe234c9c7e383df63bf542f3665bf5270580ab707" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f45b205df4bdc326fe6aeeac75516b04325528ab4b879ae958e6b3fdff4739a8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.611+f2bf6c1b1.tar.xz"
  version "0.14.0-dev.611+f2bf6c1b1"
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
