class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260427-022302"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f3527c37993a251fa566b4145991e5f7af654525c91fc90a22dff8baa3deabf5"
    sha256 cellar: :any_skip_relocation, sequoia:      "1514056a1745ac57a52475f6c5718f6a84462883f00f69045b779d031ebabb8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a1e9e0eff523b9253e0b866dfeb6297384009d5241c6c455f808786c99b8c61"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "76698b5dcb2a3551d539eb11a4f5b95163873d33eef6956a381d8b16cb15e1a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "567822fd0bba4e35e9e53fc9b83a7b4e46cef78a0b9d2e957fa901ae1d17d07d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4ef228f9919fd3b332f800b04080680b5a10f1c8e29e6ca0a3593b2b4c06cd7" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.11+b9eb9c41.tar.xz"
  version "0.17.0-dev.11+b9eb9c41"
  license "MIT"
  head "https://github.com/zigtools/zls.git", branch: "master"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on "zig-dev"

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end
end
