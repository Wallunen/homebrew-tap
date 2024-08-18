class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "245a822e3679c80bd1b6d088d0e706dc9270cdf7328d4d54606d0cf5bac56e95" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a5c729b9abf6856691454da610933d7d15bcced865f14ab1ea63b21ca8c940aa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d9359d20f85f881b08b19ee436b4a97eb6f2a1f38d44895bdd90ae5def9151d8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1166+bb7050106.tar.xz"
  version "0.14.0-dev.1166+bb7050106"
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
