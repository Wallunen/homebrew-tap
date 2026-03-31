class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260331-085132"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b998dfbd10efb8e21a4e1b637c1ab626a3d3b8e944700dad15aafdf55ea6b198"
    sha256 cellar: :any_skip_relocation, sequoia:      "812a38d96c5a0872b7824ff6dea58e249f9fa0b1341379624f50885b4733f772"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "517fa9e703d96c4f3eeedc651ae159ea7454107b4fd5e21b5b2335b1b6ceaae7"
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
