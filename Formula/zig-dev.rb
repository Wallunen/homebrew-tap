class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2acab63db75cc5bc8afed630cadd0d0b3e16d17e3bbb85987779b818edadbba2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1e008d41d18ba9c99b5f837ee71f23eabae4ac5d22cc553d23b52ac2a3e74f93" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "04f589a5f9bc61fb0949fe56da3881e88596a3e15c303c416258463bf0ec7317" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3152+90c1a2c41.tar.xz"
  version "0.12.0-dev.3152+90c1a2c41"
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
