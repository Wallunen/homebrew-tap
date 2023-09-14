class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7e382c81a092b00e68fc8b8560ff102c4ceedb9d6c6c7ebe3c5d2b4e72940ae2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5a378b1a5ca10eac489ca8ec426ad6e9603f9164ffc8e09398ac3b3625d85413" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3b4ebc32264b564f52034f24e7bfbe0f839f51bd2b8b630e93cbf24087b42e2b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.352+4d29b3967.tar.xz"
  version "0.12.0-dev.352+4d29b3967"
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
