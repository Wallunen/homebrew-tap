class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e23df6cb8820990211c1fa7d84579ccb8c22560f405c9ebe9bf06305d87abf7f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ec9e1784c9b43a432f68fc91e5ec1cf5dd29c79a6d9cb15de62526ce69728427" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0dd98ed1ed66408227208fd8d5f8579391fcecd72e4c675a2e8a784fc126ed6d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.800+a9b37ac63.tar.xz"
  version "0.12.0-dev.800+a9b37ac63"
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
