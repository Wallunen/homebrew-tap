class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2b28350e87a20b99d8bc508d59197c1dea5471abf65f49e25c87fa0903775ed8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0fd8a1047521ab5a2ecf9fc74119e33cfb534d191d0750d0fecb9a7c8c05347b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "899ba22d4501c887b9da1e8fb81e6b94f64ef95a9e22a408bc471dbff3634011" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.897+2769215b9.tar.xz"
  version "0.12.0-dev.897+2769215b9"
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
