class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e7af8df1126c67ab28e46df2ffeddb2d759e320361d105e3b40854189104ed29" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "550638d592563e6d6515ad7d80234b86e9c0baf1aebb4bcf5feb08d20e3f8796" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b1648e4508dd2498eacc1aac27906d6ec98f2b0a2a1de310860b7495a35a92f9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2939+289234744.tar.xz"
  version "0.11.0-dev.2939+289234744"
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
