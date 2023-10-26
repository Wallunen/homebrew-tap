class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e476d1e0bb085cd0c2e0b08b2a36514916562d7d752540901e0c82bea3e2a029" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe8531f49a995c3ae3dfb536d8993f9e81973bb7e7c98aa1b6d4431333e4cf1f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "39d0c955b3076e291139e19f1fb4be81baa3347acfbc24e4ef44360a5c4c4bfe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1272+5c5d1f93c.tar.xz"
  version "0.12.0-dev.1272+5c5d1f93c"
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
