class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260517-023823"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8ae3392883509976859ba458df6e7a8189029481c915362c9c92203b9edfed1b"
    sha256 cellar: :any_skip_relocation, sequoia:      "81518048bb035f0c316d85521572ad13b3d88949f8cdaab45ad7151a30d7ac50"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eed4e631b15ddf3b108995ca8031f57f65853dc0db8576c599538eff6f998889"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d73afa97dd1fe657723cf9c9814473612538a43cbdb18f9b3baffa46955159b2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c7a23fbc4f61772a17c6cd1591f2e6e95de716e2c8d1f77cf8fecf09b6fc2b7b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ae1dd1809af78ca627203e632f7aac4fe82a6a2848caccd9e5f6e5056ec1e7a1" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.37+e4bfcd4a.tar.xz"
  version "0.17.0-dev.37+e4bfcd4a"
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
