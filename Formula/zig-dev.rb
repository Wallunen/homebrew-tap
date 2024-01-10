class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "95abc6d84217d722d1767e67a2262036707c1ae25f9e4f88b4ca661c4e25dd3a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3998b2c343cb647a64bc774b14cf379065b0c9b36c9381954b5acf698e7560e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "991000195f4d45fc88e6ee2a900abdb27b63187adef5432e1592ccc2a8382b8f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2105+60094cc3f.tar.xz"
  version "0.12.0-dev.2105+60094cc3f"
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
