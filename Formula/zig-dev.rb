class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0555c16d879e719297f47d4a3615ff840fa3bef5beece3f0c5c299ca7cbc2c27" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "23666e7e7145adfbd2cffdbb37cd6c47d57bbfb61f0954341bce5913cf172326" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "145d5b66fa367277a10c25fb90a343a5fc157ab163503b349f4923e5301f5d82" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3006+ff59c4584.tar.xz"
  version "0.11.0-dev.3006+ff59c4584"
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
