class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "56f8934e1fd215c9390910d77b92538dfebba256580e69486107695094a09111" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4ffb298a8b6938790e10da0bbc77868012421c096cd227022e7901d52d97e0ef" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "118630bfa5ffb05a8b8b07a40bd26f918d870d3a2ee2022ebb4b3cbca0ff3320" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2683+31b6d14bf.tar.xz"
  version "0.11.0-dev.2683+31b6d14bf"
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
