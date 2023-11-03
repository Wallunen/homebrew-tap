class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dc1f919b723693c8f2ad11c7d89509e519f17c82513e9de2d1d8bea20c4cfb9e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c7adcc4792ab1126ffd6c86923391d279f8ff3d83d787adb300ed7db7d1b303" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2d38bd5da2719339bc1b4685da2fc376550e75fb39313fba9689c5cad2750040" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1390+94cee4fb2.tar.xz"
  version "0.12.0-dev.1390+94cee4fb2"
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
