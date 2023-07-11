class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "92055394faa6db48118f063ae3b8db14b21db261a1633dc892c0fe05f6dc265c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e68ca0cb1809d5095569c2aa9111a33c35a74f7fc8351e3ce198073692f1264d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "199873a154b889481e6dd68f9f1c5c26c667394686bde28ea83abad0c4db048d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3958+0b1e8690d.tar.xz"
  version "0.11.0-dev.3958+0b1e8690d"
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
