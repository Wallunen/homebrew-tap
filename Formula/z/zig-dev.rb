class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "91f16bc2fc85b823c002822037fd8e165c4c74f32412c92eb63448f1060bc29b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "aa431bdb99c744e8ab5404902b36ed7abccc004d5f39ff30e5591acf74877663" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "873a8a00039a39ddded2866edc55ec718a881d6ea84d7766cf75949394f1123f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2992+78b7a446f.tar.xz"
  version "0.14.0-dev.2992+78b7a446f"
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
