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
      sha256 "17f8917ffbfeeec55fb4bb638e3b74eda8a4eeeae0d5ed14c0b5337eec521264" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1e8d126e6fb2a40cd07e621fdeeb5857a24a2719f76912c6c40e9f5fd9b9cbb2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "25e04b3c03c85316ad741c9b7ad195a9cce9a3cd8977d76e73146c3fe565c0b1" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.18.0-dev.4+3f662a11.tar.xz"
  version "0.18.0-dev.4+3f662a11"
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
