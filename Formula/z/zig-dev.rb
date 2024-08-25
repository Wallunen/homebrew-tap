class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "53e5c7056f0f4efb32ecb904284b02da59b89dd3b38ae8ec970ae7c7f296e78a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3b308997d2c1d8bea246377e2c4cca176f66a7a6c04dabbc25b780ae6ec80ae4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "270178582e9b5fbf2063dcb13cd4eacb735b6b5d6c31eddb2c12528cb3c1f69d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1304+7d54c62c8.tar.xz"
  version "0.14.0-dev.1304+7d54c62c8"
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
