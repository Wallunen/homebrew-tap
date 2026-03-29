class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-e584307a"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "567f30e5cc8f5d55a02e9a7ed60ee63804ec5f66b433dad1d0ee1b95b28d4682"
    sha256 cellar: :any_skip_relocation, sequoia:      "58896f3b85721c49c91f54315c85ad5f0266e12c137cc244eedea06deb43b309"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f616b590e23bc45852deb4df9dbd48fdade717b33f200e00e0bedfa2567ec386"
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
