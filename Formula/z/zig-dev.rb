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
      sha256 "6e6131f80b92b5e47c454e2c5f2dd697c12634eaa5c10eff31c81ebd29b6330b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0b8cf47f4042a1a043d3eafe1baf6b12f3c344e08fc0577434b9f028012af01d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "878323a2abafc101741ce48f6af9832177269f6c3261ccc1d2272db5d1a83ab2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1970+67f39b551.tar.xz"
  version "0.17.0-dev.1970+67f39b551"
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
