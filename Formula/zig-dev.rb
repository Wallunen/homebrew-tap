class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "410a6b3c6dd6eec9462fa4bb432effd64809c4b2d07ad70df1a2a0761a7e8389" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dddc3ebbfd413c0647203bff31495e67c6260410a01d1af5605845f528c33961" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "af05b191c74814cb7caf9c2be403b437c7c74bdf5057dc0162857ecf4a351016" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1924+5a26d1b42.tar.xz"
  version "0.11.0-dev.1924+5a26d1b42"
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
