class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2bab77534cf1160241a8de00830c7d35c7485ef1a1b1cdcf661189b585cded9c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "da78219f3b342729114c40e6243a6e2c73b3d7d6e5d01fb46faaa9cfaedb606d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "32f7460d01f5588d172438b778e044cceaa91aa2c6fe3099d1c0838476b28f53" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3635+786876c05.tar.xz"
  version "0.12.0-dev.3635+786876c05"
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
