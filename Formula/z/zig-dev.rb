class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260430-100128"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "56e6bf639e899bc2326e84bb3c2137f21689400876881127f04393e91f453d13"
    sha256 cellar: :any_skip_relocation, sequoia:      "23f84d22b17e7e4635dd7b88a13d113db03f327015b378ed4b5b22c820daa133"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "86ca4f559d1b6eb631cb4dcac0c7fb28ef81758af54071ced88c9ef7ea74c8ee"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "994e0a660bc08e12f5e6f7889d4c5a7e5be8274c5067490e597331e3e5781708" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ba3854866a47b377bfb30ca58a819f79f3d578b6dfe42640cddb3eeab539fb56" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5437482a5ea17b99d564ea2635d385977adf2f4ba4e1375ab2b2ed0bc5d3db9c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.215+8c5542bd3.tar.xz"
  version "0.17.0-dev.215+8c5542bd3"
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
