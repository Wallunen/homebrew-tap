class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3937088990e22d1c4e22cb84c2092df062fbbd98beba41902938f4cf063061fd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e3b9df863f031e30d3fca1cd82b9f8e7924240a7a2cf56cce668e8c62f50353e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "350ca682bdb3bd58d84724d48f7b5f02420ae39ddc4e0440d105d2f007881dd2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.157+8e96be008.tar.xz"
  version "0.12.0-dev.157+8e96be008"
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
