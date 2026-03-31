class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260331-015645"
    rebuild 9
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "824e4fd88a7fc02bf35addbc3f2b88f0080c8912d99c2539e01f9e6b3dd0380e"
    sha256 cellar: :any_skip_relocation, sequoia:      "f881d211088f92380a9d76fa59b56780c2f7bde144f19fe0dcb0764fcb2bfa2c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5c994915882261d260e7c413c6b85f4ad9cc0696ac92d938aae9795bf682fe57"
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
