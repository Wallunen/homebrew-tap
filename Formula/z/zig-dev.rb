class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ab1313950ebe39a5101a2684f636b70a1e32578f806e8d620d446b2698845621" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "41ec246e9b7e886645b31dc4d1882c99c5a0d07d004a35cfdcef90042d45ee9c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc420622fb4498f065fcfc1e0d84b6c22c1b80de0217d39b2cde722efee4387b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1671+085cc54aa.tar.xz"
  version "0.14.0-dev.1671+085cc54aa"
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
