class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "083656c64e5d590e8a7637d2440529848a6c543aa593de904a5727ebc356edc6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "999e32ea39901e94f00c3d07f1ba15f5902bde57dc8d61e61ce4d5c54562e7d6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1ace548b4f62cb3e1c8bd587afe9959f335bc4b70880d439c348e5738d9b3ee5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.340+d750a78b2.tar.xz"
  version "0.13.0-dev.340+d750a78b2"
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
