class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "92845acb0cfda1c85e01dce456f867711afee0300068ffb8596eaeaacfa02c76" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ba9e28c77fa74c2e7100159ca9aafd7a1fc02671b0fab5ac7b0128f0cf51c540" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6a1b12cad06a18696071921d9397c83edd9d3ea8dbd22de76a7d7eccb1f06af5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3898+35a8e8a06.tar.xz"
  version "0.11.0-dev.3898+35a8e8a06"
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
