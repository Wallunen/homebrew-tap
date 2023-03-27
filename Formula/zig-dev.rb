class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "17df47f127d3274a9fec867aed20ef546e950e9c5537933c35ca9266b62c0f67" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ee8eae9f8baa97f271b82c6c31f42c4ea9c2dd446358fc54be703ba7c7542c8f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c1d9c7bc2712a1ecfba196e0125abd7b97a46a48525ac225521642992c2d0ac5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2286+32591c1d9.tar.xz"
  version "0.11.0-dev.2286+32591c1d9"
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
