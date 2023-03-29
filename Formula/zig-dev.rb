class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e21a3e5fa7368f5bafdd469702d0b12e3d7da09ee6338b3eb6688cbf91884c7a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "327e851c44efe870aefeddd94be181d5a942658e6e1ae74672ffa6fb5c06f96d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e3c05b0a820a137c199bbd06b705b578d9a91b6ce64caadb87b15a0d97f7c9aa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2312+dd66e0add.tar.xz"
  version "0.11.0-dev.2312+dd66e0add"
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
