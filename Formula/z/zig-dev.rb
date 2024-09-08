class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4949a3fde69b03e5f7adc71a777ffd127fb0f62e101351e1d00dd8643e97e862" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43d5f42731d6648ea7be0407950c3a3dfc22924b0ce03fd0032954d6ec60ca3a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "13832484966ba8e52d2a1a92ce57ceed291a0e7a667fce6af66aa45452363ff5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1509+fb81522e0.tar.xz"
  version "0.14.0-dev.1509+fb81522e0"
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
