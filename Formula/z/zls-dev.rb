class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260507-101832"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "840983d78c18b7a3e574d2a1104b05a691557a1e151ef90e25e3d3dba4512589"
    sha256 cellar: :any_skip_relocation, sequoia:      "9258c647fdb2642ec4e6d7b819fce61d1c37d29c270204447ef53ddce885468e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "88e01cc952278ec6d5321f540bba790b02bf58c88fde6a9423e01875ce08bd41"
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
