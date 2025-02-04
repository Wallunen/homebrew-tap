class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bde442e8a45c2dd4abb1babda2b10b54a89baf22e5978f1563f63a38cf577deb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "243682072dfe8353754630d814e6076073b9a8866b1378f65b59dd310545314a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fbe67b34e93d2d3c4e0feb08a54ded7d78fa122878fe07982dac57646d086f89" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3036+7ac110ac2.tar.xz"
  version "0.14.0-dev.3036+7ac110ac2"
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
