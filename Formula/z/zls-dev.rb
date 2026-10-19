class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261014-195539"
    rebuild 123
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "59829b17ede5fb86e48bd53202128d234f556405ade9643b3602c0f4111237c7"
    sha256 cellar: :any_skip_relocation, sequoia:      "2898e1d91570200b898b69130b1842efc40239b7b2e0fa4d31579064d373256e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "806a93231952b5eec79c1bc88eabb31bba632f49a6260384ceedcbaccc895502"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0801481ebf0027620db6729968c069401c7b80f376d35f9f91f480d72c393523" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2e451358b4f7e2d4b1fccb65db177dbb321c5a98e95f67e09aa72d6ecfb39d20" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dfa4514e1868803fdf2ae56832c88b9d400094d70ea6bb136b57bcc91af10258" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0.tar.xz"
  version "0.17.0"
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
