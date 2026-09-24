class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260924-024649"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "13a290a69607ffeddce772d461349735704e2e02b4574aaf4ff5f275587e31a4"
    sha256 cellar: :any_skip_relocation, sequoia:      "2d9621441bc41d9dcc92eccd646385cf8f6d2baa04d2bbde47e8e6b57d02aae8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "21973a92a134d19778fb2306fb40caba1b397ce18e2de56468b16546ab0e3977"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c5d1fb637fbaa64021d9a46af4ab8f7d06dc76f8b4634fe9d4d31ac64e54a10e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e1e96eb187bd8537fe14933a8e391fe81be923d52c0f9ae99a122d819af8c12d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fcf43140b971545ff6573dd06e09777a3811295d3b33f0e81d4646f8c7ef55d3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2267+48abf1a34.tar.xz"
  version "0.17.0-dev.2267+48abf1a34"
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
