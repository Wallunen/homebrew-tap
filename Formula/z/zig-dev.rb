class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "819c2eab966283181ec878ff27b61ac04fa61986b9dec047a96e212defb2176a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5f5cd490c852fdb9ff1e711fde266452b6fd1832e3b9edf62434522df806bfca" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cf719d95af09bba0cb3b84c31b23cb80a6552ab0b1a74350f2b9639f200c3abe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2210+62f4a6b4d.tar.xz"
  version "0.14.0-dev.2210+62f4a6b4d"
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
