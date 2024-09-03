class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8116f0302645049a7c18daccdf9b532a45bf364d24584a2e4a3c2e883e131927" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "31c463805222110edb99856cb28f2de441f648b7ec6f1eade5f57a9092cb777a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "21bdb376f4d7f81ad4aad7c4cbd42056fb633ed97ed49971f5caee786104fa34" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1410+13da34955.tar.xz"
  version "0.14.0-dev.1410+13da34955"
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
