class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "359657a07b376f5bf88d219124c75dbd4396dca94674c22dc9c91ccb0bf43b76" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0661899bb7ce7e2d0f568ebb96820bd188cd0839bf8aeca815fc859d149bbb74" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "53d3ca01bd691a13652ad62e0a3ecb76e33086e82dd9d49788fa9ed84f8149e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3000+d71a43ec2.tar.xz"
  version "0.11.0-dev.3000+d71a43ec2"
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
