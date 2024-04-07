class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2d14705b95b5de266670cd7521731758b981f67285b8ce927f58c99d8daac9dc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1744013dfc88c216b63311e0b5d35c166168375bb95bc29157282b89372355e5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3dc4af2070a3070bcae500117963fb0ecdd28e2037510bbde21a7aa310648acc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3561+f45ba7d0c.tar.xz"
  version "0.12.0-dev.3561+f45ba7d0c"
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
