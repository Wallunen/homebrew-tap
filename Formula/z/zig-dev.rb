class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e1b4d43f65ccbadd10cca27c8908c9038a6c62100178a60c1f04a10943b48685" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f5e2da57649ced600f5b948b7a99dd114b1dc1926be901425ff322e5d489b1ee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0b5c1b10e8798d3f978c92d24c787df94bd83eba584a0cf836d65b05c621de2a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2319+1a99c99ee.tar.xz"
  version "0.14.0-dev.2319+1a99c99ee"
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
