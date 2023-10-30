class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "721754ba5a50f31e8a1f0e1a74cace26f8246576878ac4a8591b0ee7b6db1fc1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "05d995853c05243151deff47b60bdc2674f1e794a939eaeca0f42312da031cee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f136c6a8a0f6adcb057d73615fbcd6f88281b3593f7008d5f7ed514ff925c02e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1349+fa022d1ec.tar.xz"
  version "0.12.0-dev.1349+fa022d1ec"
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
