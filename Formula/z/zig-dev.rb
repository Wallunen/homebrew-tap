class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d2200100ad252d5f1a48c8c01f2b5f734d43b74d4de00386ecaf2322a619be50" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "becf9ad5d83c17c1b607d9b5d4937a81374d41591026331c540b3eb661179ea5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "986466e257939871be62dcc5bfab027fb26d0fdeee939c7c80219a162642aab0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3259+0779e847f.tar.xz"
  version "0.14.0-dev.3259+0779e847f"
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
