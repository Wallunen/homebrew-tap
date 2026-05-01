class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260501-092815"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "cc47670603c73741de86a61020fadb7880748e2de8716250f3e991c9e8c4495b"
    sha256 cellar: :any_skip_relocation, sequoia:      "d594c9b85b5abc3c6c3f8667b6c1ca6cb44d2259341ac7152480264c181c1106"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e26029c67aee33839ceb305492fe5c18f4418aa7d9fb478ad0c021c3f070b0a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c619f99412571628805743b1c26ffeb1041a5f1925461e9c5169907b684a80a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e4e803534bf1e05fbb1b211fab6983880e67256fd46e361c63f27836009d22c7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "15e703d4e951d6dca8824250e2bdc8a41bf04b707389d74f75d82f8e8b4b03ad" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.13+113f79a1.tar.xz"
  version "0.17.0-dev.13+113f79a1"
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
