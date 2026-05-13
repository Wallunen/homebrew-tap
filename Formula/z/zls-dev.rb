class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260513-175703"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3b7f767232ad45a38d506de3255bc5f260cba7a090453c17b64af312f96173d1"
    sha256 cellar: :any_skip_relocation, sequoia:      "d4b46e9d6feabbf16b902bd7e52b671c0050abcb899f663d15277aaf24071ff7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "96cfd34a4ba2d61c1216d805bf31a78e869d41c2ace3bf630fc0e4f2cdb06e3a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "79e4d7342540c61a1bff889e834989708717d3c7faab773a84852e820df0897c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6e909c9f7fcfa978ad729b9a9d07d401a14aa7d92ca03d4c7481cc2ce6f4bbf1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3cb3f88d7d43f33e70521a9248b6659bffc835cb03759bc54143e46d87c4d5ab" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.35+5d97c95a.tar.xz"
  version "0.17.0-dev.35+5d97c95a"
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
