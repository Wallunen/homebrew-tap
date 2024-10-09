class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2868767bb0f7444d8f063aef6460727225f708bee7062ec76af12d8ecc5742b4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3c23e60b9b694b96e4c23b3be2f6826c642d72c46284b629f315e70e737f7b8c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6bd63fa6730514cfd8822c4badfeb3be15b3573c375564cf419ddf2d08ed61c3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1823+b00cbecfd.tar.xz"
  version "0.14.0-dev.1823+b00cbecfd"
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
