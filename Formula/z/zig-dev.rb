class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "09832ea0ea94ef04ef4b63c87f1066c41b7967fd12590d1839ec07a7da0eee67" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ec4fb25e99ce1f1bbec3a2865fd1f450591322b489a9ffc87119e22e85665ba8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "239b76845dcfff79759d00bdc43fa6d8a33d6535d059eb7586f662b57f2730a7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2126+e27b4647d.tar.xz"
  version "0.14.0-dev.2126+e27b4647d"
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
