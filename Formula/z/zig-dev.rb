class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b9b820267bca12a997d1167c12a26a66905053e7f798ca50293a40e94febc1b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "009615e7c37cc384e3350bc8c87221183febea38ec23cfddf62b65fcf56c94bd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e464e01e28ee87b7a7579e583ba30794ce61d6eefb1bcf81ad8c87f183e59118" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1917+ecd5878b7.tar.xz"
  version "0.14.0-dev.1917+ecd5878b7"
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
