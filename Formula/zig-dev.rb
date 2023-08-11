class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1bd8130c8e5e965ca4046f6a1ce0b74a00c91fd0917fec0e4f47df2d1faa69f0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5a66e39d287bcbbfd83e268c73dad2f778084155da5a63fd43cbe84475f6684d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5f507283f02f823ebf7284adb0d24d299e618411a8e24cb41627db2c7afe757d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.64+b835fd90c.tar.xz"
  version "0.12.0-dev.64+b835fd90c"
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
