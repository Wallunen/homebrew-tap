class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b6cda72cd90d548b822a514a3c4c2a34e71bb1084363328b60cd321851be85b6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1752c370dd545c73c4f14734c9b7de1cf76c638c48caf390fd78e824d1bd0402" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bcd2cd624291baabbd1812ee1e79d8d52d9e5b29b444d85e762483028df625e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2159+7916cf6f8.tar.xz"
  version "0.12.0-dev.2159+7916cf6f8"
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
