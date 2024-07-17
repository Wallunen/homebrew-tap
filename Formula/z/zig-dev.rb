class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "41c8187a540152f203f7477e58b57ff60eefe3fd2f9e07d58283f1528998b9a9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2084951df1424e09835d5760a8fad2a4c939f35d5bfc946e2a43a5004707745a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ec6a0bd1fdf54edcf4c96ab7f7ab8925870b333097cd686437292d98981fe8bd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.339+d8f81372f.tar.xz"
  version "0.14.0-dev.339+d8f81372f"
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
