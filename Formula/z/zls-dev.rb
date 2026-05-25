class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260524-094953"
    rebuild 6
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8e994948078acf583e0ee54e687c3bcfa26f8877af5bdc9c456cbdd1b03ff442"
    sha256 cellar: :any_skip_relocation, sequoia:      "b65130945029b2cf34e2824628ce0eefef567530a39783aa0c4127cda59561db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8e654ebabba81da05d76d26fbe8e68129cb23838b3dc31ea85080a5e0f077319"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c1eb7bfa4374c0ee61429549cd6a8c86f3da91c832986fb779d83056ea99e792" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c3edd36ac540de85eaf7f97f49e504c16d7c486167cadfb3cc09b91092d1ea58" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "48c9b3d35fdbc2d32889acf37d2dbf3cc19bb1098c4332e4ed3439f1f85ef504" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.41+31963d0a.tar.xz"
  version "0.17.0-dev.41+31963d0a"
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
