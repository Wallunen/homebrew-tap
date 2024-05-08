class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a771e134afa13a37d9350306c71762131ff6907bc1ed504761fc823bb3423996" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a1d9b1b4c1ef1f445793a5e29fbc68c65c1f3f79bd107423590163f1a4aeb05a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "02a13dfb1910fcb9961b5e7ca4b0d19cb41caeaecdd24439ece01fa39a1dca8e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.75+5c9eb4081.tar.xz"
  version "0.13.0-dev.75+5c9eb4081"
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
