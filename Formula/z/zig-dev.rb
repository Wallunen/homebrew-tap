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
      sha256 "0902156964ca09cae648bef15deedc8c2a76085bc27bc257ad5c9ca026e0fea7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a42509d6542642f6d9d700746dbca0389fc7a009a3440a803cbecbffde7ef1b6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9268a41aa95338b37f9e80694d458ddbbd3d975687c1b2b2d4082612a7cc1e30" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2281+83624acf6.tar.xz"
  version "0.17.0-dev.2281+83624acf6"
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
