class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aa05702413cd90c6d3c87172c221b7e4b2a051ac4d498f3ab72b3dff0523522c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d16bc1c7db07d237758cbd85cfb5c089d4019accd5b29c0a7a6cd4f97f851d76" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "52c62ec880ac21aaa3a10e568ff296427a34391feaa93befa08753c0ce1b7e57" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1080+da8fbcc2a.tar.xz"
  version "0.14.0-dev.1080+da8fbcc2a"
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
