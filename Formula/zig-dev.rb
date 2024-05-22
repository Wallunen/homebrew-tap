class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bd29a318b3c8ad42a851c3c7d63ff087542ed4180b8767c00d0a6e46135c41c5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "25ba7171f764b9c223c626f23c1ec473d539a2d02a9b9ede40666cc86bb44fab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a53f90e0f7dcbcd74ef1ba52b655e7215f186f6b69e3c3f426c5536358970e34" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.242+6635360db.tar.xz"
  version "0.13.0-dev.242+6635360db"
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
