class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260519-105724"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6c14dd20f26d0d2976fe823b8360e6d5cbba13040e5ffba6920e13ad448e607c"
    sha256 cellar: :any_skip_relocation, sequoia:      "23fd94b8f88c99d8fa50baf450698e79818678dd7c4aa65e051da0b6b8cd71d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "522b70dcc5bf29f671f9b3c9576041dea4250f1d3d195a15795aca80163fa317"
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
