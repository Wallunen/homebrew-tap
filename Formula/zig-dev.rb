class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3965a2d5d1f1d9f60abb54e999b9f04a5761f2d6e6a9edbf6efc593f9d0c7d32" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "721ee07b2f6235ecfadd16aea251d92f0649b0bf57ae22e825815834a276e767" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "acc613e6492ba4c755a2b07b847ca9319a3b343235deb30fb3bdcc25e3f4df1d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1908+06b263825.tar.xz"
  version "0.11.0-dev.1908+06b263825"
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
