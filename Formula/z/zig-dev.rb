class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260403-163420"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5e5defbba7ceedbf76cca1bf94c704265d75cf9fbab37d7c37af2c438f9c7d7b"
    sha256 cellar: :any_skip_relocation, sequoia:      "cd697064cc974abb678b70db3cb2fd1572e34ea361c8089f078ffb847e7724d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6117c9d8c8adae7b1520b89b54538c05985022e8dbb5ac67cc200873756ebbb6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "179e378a8b415735641eaba693910a2b7c43ce00a1d2c9c902da93cf44dc8b7c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "86d50f56a4bb5a3359f6d8a58932cabe87245a50405b79b2cf6dad68f05a403d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f8a3a58b83011d4fcc895032418867ca5ba812ff76df60f563706269cc098353" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3070+b22eb176b.tar.xz"
  version "0.16.0-dev.3070+b22eb176b"
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
