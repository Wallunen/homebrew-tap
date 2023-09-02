class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "46a1741dba0d81a5f083a088129357e726019c6efd827f903a5b3db84ec8ce44" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fbf7193dc292ed286300615cb276eba2da6e27669242bd389ecec85a239fd2b8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "68415023147c07a3fd1659495e217a49401e0a25a5e75ed03b3f972176bc9d28" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.252+5dc2db805.tar.xz"
  version "0.12.0-dev.252+5dc2db805"
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
