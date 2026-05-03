class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260503-022811"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "93908fa6d6af6b38b2fd6f1754da59b05b42c533db48e54849536d21e7051e96"
    sha256 cellar: :any_skip_relocation, sequoia:      "1d624172b7813610c555744bde1d957e222800d7863e70f87e0b44839c3e6b7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7c8fcd3123f8d8a5be8e8ba82b7e50d0a3b8f2a9dc93544f1e0889ee8aad9f60"
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
