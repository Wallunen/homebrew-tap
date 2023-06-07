class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "272479be574fe0191a2eeb635afb55d5bbfc874c14588d2fdd09ea498cbef469" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b9f8c11fba7fe6697576fed23ed9c9aaa499183a7ed4591ad25457683621f04a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b1fe7d388f27262c3d3a949d16cdfecaa61803baef595e8b050ce51f12f3c3c8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3381+9ee0a706d.tar.xz"
  version "0.11.0-dev.3381+9ee0a706d"
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
