class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "23e656bbae5b6bc8c4293227f3dfe583877ba61f667cbab4311fe58e8d9a0298" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "159d2e4544114ba0cf22053cbad500f79a528ed4ea0a18c1bccd543c22e4ce4a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b58e0960bdf08ff9391fe3fdd58dfa6834c037493487edc2a039a6696362c937" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1200+5f92b070b.tar.xz"
  version "0.12.0-dev.1200+5f92b070b"
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
