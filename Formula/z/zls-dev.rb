class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260513-102000"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2402ba88ee01d59a254f0a52d2db44d61fd086940a9b2024824c05bddb5ac579"
    sha256 cellar: :any_skip_relocation, sequoia:      "1e71c46bdff836a893f8846b71bab881b4390dd07822030c00a1a81d91514319"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4b381aa03fce8ee49d7c312bca858ebebc10309a11f8f48c34578df841967267"
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
