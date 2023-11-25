class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ae0b0488a7c2d358450dfe69a55b7ed49a31cea9385056539191d090f9d203d9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bef87a10d25fcc37aa64b33deaa4785d94f8c74e3c180e86e65c77351cc9c466" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "281d8a9c47d4d508f5ea8a33b7a8b97bf7c6757579033ae8c0d0d24c563432c4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1718+3acb0e30a.tar.xz"
  version "0.12.0-dev.1718+3acb0e30a"
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
