class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0bc0b264039294af7b594de8699839edc88c50fbae9bad7360a9b939b3b5e333" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "65f5c9b5f1e974909c05981f48382d0afa997d6421b53838b3addcee013420a3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "952110ea37ccf7819742e3bb093ca2357b138d241ad7cf29ab9eec4a60b7912d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2586+3c7970dc4.tar.xz"
  version "0.12.0-dev.2586+3c7970dc4"
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
