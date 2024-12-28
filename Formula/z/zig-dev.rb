class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "519711f2fbeface7b77db3ee30470992c13da9206d4129dee37a55ce7bc72181" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e129e9f9d40c758d51e512c7ff146b0d019558732cd0f7ee2dfae498217bb82c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "665b1be7514125edc036677657d9ee86e2c9ac9b794fea4494ab693c87e24bc8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2569+30169d1d2.tar.xz"
  version "0.14.0-dev.2569+30169d1d2"
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
