class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-a3ff95d8"
    rebuild 7
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e94d3dc9936e0842a9ef10d4b80deb66a58b995220f5566a5669db60ee534843"
    sha256 cellar: :any_skip_relocation, sequoia:      "3fe52304c9b0834eac2774ca1f0e3b75d4696213071af6ad44c2a811f8521b7a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa664ca0748743ace3ae8f1556b6d781fefa41995ba3a45a8c0893989e625187"
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
