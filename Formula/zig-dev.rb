class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8b7e3d3bfa8b56c56880cb56c33809e7827b3cf01ae24f506b64b10b1d0b05be" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e9b6c43b5380db24847d9546fd7cc481dd08ba2d2e121b14a11443264cd78eab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ec129b0ec60ea38741b25b6976cbd87d578eb2f1f2a3450ff723b27815dfb70" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.73+db890dbae.tar.xz"
  version "0.13.0-dev.73+db890dbae"
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
