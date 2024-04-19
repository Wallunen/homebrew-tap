class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ba5c232714b9168aa16c7b449bd9a22c8fccbff696bf9c01c7dce43dae24ad32" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eb3d7f5ed813240055c9262d59bc14c6348a1d6bda2e2b86655de0f2b334f09e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "33827b801fb47c67698ecfb070408e5b6678900d9feab4263a7ea6dd504f0d6e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3678+130fb5cb0.tar.xz"
  version "0.12.0-dev.3678+130fb5cb0"
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
