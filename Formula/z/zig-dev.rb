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
      sha256 "c4a2008dd94901b83d06459988f440249000aba404069bd2c65fbc23cec909d7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18a03db17c4505506dd0258132a4b6d7aa1c8c2ac002d41faf4733581412a34d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f0fcc0f1d028a983eb66d873adf2687b504a710789dcc52409a5535c3ddbedc2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1464+6aff551f1.tar.xz"
  version "0.17.0-dev.1464+6aff551f1"
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
