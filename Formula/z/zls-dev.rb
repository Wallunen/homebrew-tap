class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260527-025306"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f246b338513457eb606e73c08cc287ef00241a3c9919056e72d17eaf1c24738c"
    sha256 cellar: :any_skip_relocation, sequoia:      "bacbb0cd600746cf0170cf9d2750bb753dbb3c426769f553372c190b521b3093"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "347f0427202aa68b8432914a3ccc4f1e87c2e7a769f141d4dcfbb3ac4df2c5f7"
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
