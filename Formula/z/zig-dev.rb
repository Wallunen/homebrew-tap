class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "99564c8198c1bd829b337fdbc48bb3b1e68fc270ae1167dbbce82fa8d7451add" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7c287108d833b821b6654dfb2230dd579da318a3d29616bce1b2d4dda6a34b61" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ed36a777f4252908a1497736536e63df4e4c614fc868cace870540935b26e596" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1411+a670f5519.tar.xz"
  version "0.14.0-dev.1411+a670f5519"
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
