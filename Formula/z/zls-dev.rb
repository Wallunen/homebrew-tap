class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260504-172536"
    rebuild 5
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bfc526d84dff28a9a94f6881a623ce0a3792f0f59d42dfd5212594adfe942ed2"
    sha256 cellar: :any_skip_relocation, sequoia:      "246d1b644f5c1440acf70847569600b1ba336c1116476c0387e7787b4c6677a5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f975a57e7b1023fbc63fb1d72cd232763f7af3425d99e77bdd471067891f2ff"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8ec9f5720a634efed800f8887c3616f3e1fc87c6b9f805a14d0b69ae9546f0c7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0363406fe2e7af3f8758e345f4693d954feac7b619e4c2632b1f95c918eead00" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "16996c48fc24adaa3b26249d7c1dba0aa5eea10db15d6c1bba7c7f3c1bab7fd2" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.21+5767f2f1.tar.xz"
  version "0.17.0-dev.21+5767f2f1"
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
