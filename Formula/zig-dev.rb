class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a9e98e340694986e610f9a40edc46b10aa0f4fc48afbc2b12e073bfca78300ad" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d9de27df244434a8c6747d85666e63404e5fdc5e298b8302fc65f81afccd7946" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7c14b976ac9fdcf988ef4fddd95ce7e4738d4aa7e35cc7316c65549dfc39a216" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.249+ed75f6256.tar.xz"
  version "0.13.0-dev.249+ed75f6256"
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
