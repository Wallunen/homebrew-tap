class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f4deb5618beb06a0309077f7ffff24253f58f8b5bf0b23b0d03cfb233a4e7b44" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "17bd42a87128239ef3cc5dcd5b06b8f76b97b9dd8aa2c4cdba8baec7d5ba472e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e6a83cd37551a6207a8044e7db891054d92859faf3db94aa9b51bcab77105f76" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2711+f995c1b08.tar.xz"
  version "0.12.0-dev.2711+f995c1b08"
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
