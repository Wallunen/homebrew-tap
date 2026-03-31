class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260331-015645"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bd806e3b1f7638b122b23d1d05e25d22dad00ed59eb3eaf3f7d1aac8d11ed37b"
    sha256 cellar: :any_skip_relocation, sequoia:      "bc4c85a1e01cdd9953cb2c5f280d34b9c2295943fab9065018be1e0226e6a05f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "450cac536d98de813cbb6bf54f042abf9537f49968a502cf0191143a38a0e247"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "96b69a14add4ca57163a03a139fbfbd64650153e40827ddb64194c33d5cfddc1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d2191b807592b6e2c990cb36fbbf24f18f7f924ce8f4bd3cfbf9e6b1a6c0a025" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "52c1cb7444d163cb4f0d4453024d8cc913bc030a6126ce9dfd467052b02eb766" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3041+3dc5f1398.tar.xz"
  version "0.16.0-dev.3041+3dc5f1398"
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
