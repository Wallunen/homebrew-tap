class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f3b2d51fd2cb74b96dfc0128d304dc26df504affea7e307cd0a155fb445efa27" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d69b94ed9d772b70fb93621f7ed3ad6d74a9d59539c40b3108f8b9b6b3d2518a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ef3afd33c547600eb55b8a2173c9d595bb4cc02527487415a7198cea465c27c6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3797+d82ab4fd8.tar.xz"
  version "0.11.0-dev.3797+d82ab4fd8"
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
