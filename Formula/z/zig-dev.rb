class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260922-192934"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a399d112f31b5d9e7c2899bc0b2b11586481e7c6e8b889af6aafaa12f6d319cb"
    sha256 cellar: :any_skip_relocation, sequoia:      "9d181086f6e644b540ab9340756cc7ab5ab2396217338db8216259e8772b450d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cb7eaadbb6e583f6bb3bf232810e677a37ed59b31da31e40d3a926bc0799fff0"
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
