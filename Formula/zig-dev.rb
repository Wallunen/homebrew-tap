class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "23a7010b852bfb7c1d3a280e6b0d634b5b70999b8143832faad591f9521d9e29" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "878a81d4024f4e671576f72da5bf0669f42053f2d499191af0d387d35c304802" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "61dc34c8509897414997c8ebd0bf0b2f21f52567968bb211231fb81b70193189" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2701+d18f52197.tar.xz"
  version "0.12.0-dev.2701+d18f52197"
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
