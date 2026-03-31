class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-d806429f"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "68d25d2585dcf5c376ddac96b30bb1fcf73cdf1fbf26b2e2cac08ec365c9e590"
    sha256 cellar: :any_skip_relocation, sequoia:      "a2240a9fb8cd64765ba3ecd69ff8888c8cd78adbb38ff26d5f6d92a41a45c994"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0ce9e2f0a6afd53a31907ae732d5b99ceaa2577afec60be5fb61b587b803bd6"
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
