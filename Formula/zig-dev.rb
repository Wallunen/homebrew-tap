class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4b505a4148438e1d941b410ec842b8b3ea3102fc4b64a901c9422f3ac2c6a10d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e035dc31a21e182071e39733170024feb9811819f0827900bbe9c707ddfc3b2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8559677a4d0d91ccabb7e8ba47b00ce60b199f43aa303a8686b28c4c5718c81b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.354+0c2cd8381.tar.xz"
  version "0.13.0-dev.354+0c2cd8381"
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
