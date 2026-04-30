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
      sha256 "f2a386143fc1a30854d14a881debf5e312810f23d84b26e19c5c82909bb57958" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b34f603f291eb25ca80c4d2233106d080ce8d39929cb0299977db614c7a0ac6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e909c714463eb94386a1d8a965a353c81ff5f25a56a2d962c926c66be745e1bc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.135+9df02121d.tar.xz"
  version "0.17.0-dev.135+9df02121d"
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
