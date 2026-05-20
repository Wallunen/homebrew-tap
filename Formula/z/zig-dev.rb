class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260520-024612"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "aae2b8a3ce2cc97a9b9b3716b60e96ecbe7b7bc6e63e77bd35f27a2652906b63"
    sha256 cellar: :any_skip_relocation, sequoia:      "31dd61f79fce345c0be348b34c284f6902347e4af9336bec4d6ccd04b4e931e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d58741d00653fbcc8c87684fb26fe69ffc33a25dfc3343cd56b303df6f06fc19"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2f58dc35e846bdae3b8a1ecdc685abd753fd05fdcac7970110c23c4befabf74b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0e520d3c1c19259963e35fe96651a1a6b0b3481b293722e4d5ef824af6c69d06" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a9fa6efaf2b07bccedb3225dedef89e0e68b121f3411a327e2e0282d822c3244" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.313+27be3b069.tar.xz"
  version "0.17.0-dev.313+27be3b069"
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
