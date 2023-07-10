class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1c9ae156dc4a1f787408515875f580170bd2b5ef0d2bb94acee7a884a9efb31f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4136282453caf793e58f7aa83ef4b786aab4c28e00e6dfe5c013a12b88d08ff6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7205b11efa7476d96cce7dea1b33db98c8dc2d7ea7b7f9563efb518a86aa161a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3950+a75531073.tar.xz"
  version "0.11.0-dev.3950+a75531073"
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
