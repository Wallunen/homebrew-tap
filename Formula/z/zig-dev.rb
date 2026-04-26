class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260425-084426"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "275376acfd4f7af7d6b27ba24fed8ee7c455f6dea876762f64c9a01ad6935e7f"
    sha256 cellar: :any_skip_relocation, sequoia:      "fb8aa7837261734d94a563254cd6f0a59d89b8cdeca4fe928b1e12fca5cde229"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "188d7534a7419a4075984d8506a420c876ec94971aeb9873304c60e032be74b7"
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
