class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260426-021200"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "56103b4f6bd6ba7620bba3917392b46a15397a13a0033b16bb24531ecad165ac"
    sha256 cellar: :any_skip_relocation, sequoia:      "9fc7a1d0003773c46c77d0d0c646415e4efeb96950fc1913d22d4937a953368b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c4aa06895b9369fced3688824f0a9c037a429c9ebe616ea286a93e11ccf62d41"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1dd4803939a7a7e76991c5d41609aeea9552f0bae7708a1c622fc5b833712f7a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c639cdff9420a2a3def41eb0c3611f57978a0de847f40445f19a0533e1e0026a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7a6de3deefbcf1bfca6367a14bdf25d95a233ff92bde05b2e67ab49aef301f21" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.131+73c51c142.tar.xz"
  version "0.17.0-dev.131+73c51c142"
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
