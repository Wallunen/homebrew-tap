class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260725-165100"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2428afe6cda666f925dd7ad7de1a148bcabba0d5cab083060be4753ce104230b"
    sha256 cellar: :any_skip_relocation, sequoia:      "2357d9f7ffbe1672446f931aa58260a1a4c7ba723b51b09267b32b1da5394939"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7a5d0481e49448798c7843bb8700e5d108d946d477409175116c816e403bedaf"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1dd73a374c9a82c795bd57c64c7a3f33375b1801a9256d7b84b34a579236224a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "215c71456e0cc8994e0c56438d93a4a512d3780a9e6a3a48a8917db7f4cfead9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2a196dd43ec51e64b6de3ed0e5f9f217aac88ad187e3ae5db3fe037feddef118" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1465+8b2d0ce21.tar.xz"
  version "0.17.0-dev.1465+8b2d0ce21"
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
