class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "480ad67fbc2745a00c88ead16c4d9582e2666c9dc8fe224871ea54b79da3fac6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8d1b04dad8d6771b93b2c04b212c608718d72aa6dce4c1ca36127fd5643c5779" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "71db45c7c87c8903c8a7daebb3ce5cc4ea0f6c98712b88b979f94faf9b392582" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2565+9bf97b849.tar.xz"
  version "0.12.0-dev.2565+9bf97b849"
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
