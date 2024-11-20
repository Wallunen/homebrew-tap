class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "17946f28a71305640a1e79e8777c23ac19ac3e30bdf27c2e70e26dd9f9c57ab1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "21eabb4a413802fc6f94a51244d6b8bc02174d7da89fe92694c8b383beb58b77" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fa6a56eb5013be1470d5fb9e532550f20e2dcd84ac0182852ba0721690698365" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2265+8a00bd4ce.tar.xz"
  version "0.14.0-dev.2265+8a00bd4ce"
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
