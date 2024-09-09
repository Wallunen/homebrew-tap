class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "39e71f990f9fd6562b58e1900f48ba96b39bc16cce3d5b1aa03496e3211a3d7e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "367421c55363f33574f2da85fad24307749261578f3b4c6e0484dceb382068eb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e2d69cb88895245b665287e929c0d5d7ce8dee6e04747ba4e6e0e632c87fb272" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1511+54b668f8a.tar.xz"
  version "0.14.0-dev.1511+54b668f8a"
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
