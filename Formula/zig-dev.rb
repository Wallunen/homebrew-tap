class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fe78f90a1b36e5ce8f644c442c727c05cf8fad256a969b3e318b70bf01cff58e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ffd9d10323da501d0a2685d78894e834147dffbe5de5926cd148838e3ffad4ff" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "47446ec283def062d227bf401348ca90c488ea6ac61417e34e8fcfd78b5ffa84" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2271+3a7fe0d01.tar.xz"
  version "0.11.0-dev.2271+3a7fe0d01"
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
