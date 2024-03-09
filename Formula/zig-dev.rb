class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3d2fe9d76e0bc72430d142cde671fc4f99919aad451d3582121b2746abb5791f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c3d455129203fc5ebab77bf9ab4580f15a60f7d5a4a856ef9a1dc80aae856c02" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "66dd365aee3569e71940eb6fb2d47466f04b5ecb430aee74b9624b42ce17d6f6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3180+83e578a18.tar.xz"
  version "0.12.0-dev.3180+83e578a18"
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
