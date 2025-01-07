class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0002e17ade57bd0ed3a852ebab2b46e8c42f41ec8609c77be52b0c135fc61e70" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "df2940ca693005a54b4ea669562b5dc4efbb4789f3206fa8efd6c81dcca68357" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c67263ed9122bc296c939a4fdd07ce457c518ffcd964fc136722495284e0c397" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2615+a7a5f3506.tar.xz"
  version "0.14.0-dev.2615+a7a5f3506"
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
