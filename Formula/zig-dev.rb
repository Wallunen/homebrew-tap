class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3318727ba8ca2c5f3a7e071ea9aeec15684288869f5d137f956e6ba04270681f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f22dbd14d8946b45e86ec8ced8ef79682a3885d80dc470c8cb094dfc3c49de22" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc34228c74265ed9c2b38d4c5d88ae2b2d1ecf19d1e77d463b03671e57b49eff" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3203+7cf2cbb33.tar.xz"
  version "0.11.0-dev.3203+7cf2cbb33"
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
