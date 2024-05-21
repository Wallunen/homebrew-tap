class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4e641a309a0e156e8a490e7983a505c5785e867e328eb7a4c15cd7035d02dd4a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1b7020b48e89e40e39be066dbca2b730444466a0de269110f1a287558c7600f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8b304066c369c2c52349803e3b777940b4295c7d4098421df462990a839c4dc3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.217+ad7217229.tar.xz"
  version "0.13.0-dev.217+ad7217229"
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
