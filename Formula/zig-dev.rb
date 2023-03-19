class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8d4d6916ea90037d4a7ea1d903d09690930d4477a283eaaf2de22382851bc0b2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2bc19650da1ff75fe4e1359dc0f27239c87b3758a1c8a889a8e91816f9168dac" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ad012e4736f2aa55005e32929bcefde7474c674a9ff280c16d49dccfac35e819" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2160+49d37e2d1.tar.xz"
  version "0.11.0-dev.2160+49d37e2d1"
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
