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
      sha256 "83e04a4f9b3711ce9bb82872d8f339e2f554ab20f15fdb177179339742f88cfe" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b767a215bb9db7a2dea1e2ead31b8ae9bfde08ea5510406048309a218046df31" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4b1cfb43f7ece2b1829d7f36e185f7b11f3864c876ae89180ce9a20aeced54de" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.295+0bb4338e.tar.xz"
  version "0.16.0-dev.295+0bb4338e"
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
