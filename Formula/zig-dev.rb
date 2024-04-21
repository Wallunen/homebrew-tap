class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5576cb2e1a356c29d2d9dadc1f87419b87de8cf829c34a61114256eacc3df0c4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8a8c28e24b69a5cac982fe88e90c87fd964fb0f393d5544ecb8b34e8d4b34922" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "10fa7c1b59c31f5a68d34fd6e18874d6be2a2c71faed24e1a92750051875ee4f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.8+c352845e8.tar.xz"
  version "0.13.0-dev.8+c352845e8"
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
