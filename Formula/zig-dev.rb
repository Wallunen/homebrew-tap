class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eba1c906635567f1c7751b9de319416960dc19b2a2a83f59f0b3c6b2996feafd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d0484d9bccf3e2f2e814a3e8893e548fb616b7e7f41b658a8f00d78f3431cf31" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0e9d71feb611fd4fc6740b7494f25cfeeeb66554f7616b43c20d96d0265a22d0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3394+c842deea7.tar.xz"
  version "0.11.0-dev.3394+c842deea7"
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
