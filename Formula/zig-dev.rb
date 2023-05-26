class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f9763bb33b613fc86d5e02ca539cc6cc3382323390ff16c375e17b05bd0e3e2c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cfe912a6b71a9ee78effa62b1b302c7d3d6ecd7b1517e9ed956934c2d0e0cd70" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3360b0e0fa104eeb05974b6ef22c6b9c895d66887af8e0b0c6ce7b48868d45b6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3299+34865d693.tar.xz"
  version "0.11.0-dev.3299+34865d693"
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
