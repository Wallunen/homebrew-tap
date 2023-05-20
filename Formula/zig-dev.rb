class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7266ce8d2126698323dd691989172360f099b461ae6198e9ec799360664e43d3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "80cbd37d6fdfdf66476abbe9c7aef3b14652ba6df807e4e516296301930b1cfd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "705347c0ec81f3155f781314bf542e931e9567422ee3354e80ddc75cdd49eb33" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3220+447a30299.tar.xz"
  version "0.11.0-dev.3220+447a30299"
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
