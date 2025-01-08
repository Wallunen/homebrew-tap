class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b8da4681999188ee3bd87ac3dbddf6128bbedf83bd8921f00d771f1ec1a9b8bc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "08f3910f5e3d9fe3aa0234c0ed82f21399fb672f4138a89aaa1ae854f1a12301" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f439276040afc85fec166b4334202d85385fbcd10a1a467e1a35525049ba7d21" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2627+6a21d18ad.tar.xz"
  version "0.14.0-dev.2627+6a21d18ad"
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
