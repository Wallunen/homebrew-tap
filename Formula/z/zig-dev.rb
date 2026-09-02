class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260902-022853"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9382268cb69081ad6b9311b87df396dcab9f22babe05f5c03bc38a7ba87392c1"
    sha256 cellar: :any_skip_relocation, sequoia:      "54ae4bced4d69ee63d798ec872c6485e10c514819eabd9872b7ae94991aed9b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8e0a46d226af906c7310ea95c6aa037a5d589a7737b581b8d840e53c60838f68"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d2279bff3e09e19473877a96906295145ce237db25278ac53896d279d25cd6e4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bde1e44e56610410142d6fcf45925bf94ea31000c5c3a7b6ee95839e7d26c44e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d9202688fc47f931fd64cc77b198412b070b21a3669d00ec469b58df35501e7d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1963+e00c6c439.tar.xz"
  version "0.17.0-dev.1963+e00c6c439"
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
