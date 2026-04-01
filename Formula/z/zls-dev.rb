class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260401-020526"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f3a39a0fad58daaf7bdd9e72e8d1f366cb8316a0b904738f489ee3a5621562fd"
    sha256 cellar: :any_skip_relocation, sequoia:      "4c5fb8e309d566c053e1fbd5ae9153c46b0dabc8ba62149a286e2e996d411045"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2b821a96bce0921433f9f33d91b5cd9cc78b61257042bf7b3e8f3a366ff52aca"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e53ae91d577ac217264e4790e78b0e60cb4b647e5edbb3a1b17f039e103b2fcf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e1756b20c980e2076dc8b7d6aa435eb060d784893fc43481f6e0aa27afc2efe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d1e0c1f86f9e5268c878630ac76f04691747c7c81964e165a9fd02137700ebe6" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.296+ef64fa01.tar.xz"
  version "0.16.0-dev.296+ef64fa01"
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
