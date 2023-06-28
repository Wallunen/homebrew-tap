class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f53b1d884e71cfd207d3226a9fecae804bd6ef272085c5107266bb0ff4733ab0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18d2bb207d7fb95230b153c7a823043690e6851253212cdc7a58c60074aa71bf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "37817e39fd3f49f685aacac0e4b0fcca205c13f8c3715dc712fd1990c111f9d9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3867+ff37ccd29.tar.xz"
  version "0.11.0-dev.3867+ff37ccd29"
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
