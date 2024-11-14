class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7118faa377138818ee8ed2ff8cb5012ad52a4d0825e730f928cf15454e258d00" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dbc9a0d7b1f2f6d77c64c898b9fa326a16ed5456c9e2fc36c7987a6534df178e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c2c01ab910e261c5562047516bf54a7104fd9684a0c5a245a93a716f8fccee28" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2241+c59aee03c.tar.xz"
  version "0.14.0-dev.2241+c59aee03c"
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
