class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "45a51fad358480f33b9492b1432fb25f2bd10c69db5210eed48ea903d70d723a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "90863db3a8607ce0eb88c2f3f39090ecc8e29ef3a3e7f4de0f8b0f511698047d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0cdc9c144b6f2963e661da0de92b59c0b10d3cdc3b8b2af265b64cce51aac39d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2542+5a3ae38f3.tar.xz"
  version "0.12.0-dev.2542+5a3ae38f3"
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
