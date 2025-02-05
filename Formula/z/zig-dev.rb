class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "85b2a8ce899d00c937088f3ad6976ae9413319d7ba54947b3212dec1ad8a22a6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "03e1b1542ad701ff0416f7634a58af6b902761a77ef27972058f2f5e8e8a956c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ece2d77f9f810e766d58274d72238f4f3c286007fe8538ac6f23c41b6732e531" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3046+08d661fcf.tar.xz"
  version "0.14.0-dev.3046+08d661fcf"
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
