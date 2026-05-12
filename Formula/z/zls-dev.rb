class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260512-175452"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "abd0245f1e3cdcc9bdb91407718d1910a7c7ac836d8a0a7f72ea20550d38ec3a"
    sha256 cellar: :any_skip_relocation, sequoia:      "88ea9f07ce6809942be4a0fdf7774e6e5d76c9e83918800a7003d12f5b236298"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cbf7b8c790ffac8f439081f4769551a7d152057ed19243e9336974df879ee2d4"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d75adbe11e6388050d32e0943247b66831d1ed1d84b92d658a2cb8b42318b2d5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "db0017205f7f93a46f2329c8339b3c86fdbb428f13401fcad9d8a7511cc4fb58" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f3636fe11ce60a38684812a4b7e505cfe3d6fadf9c44dfebfdeb12da06450516" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.26+f2986764.tar.xz"
  version "0.17.0-dev.26+f2986764"
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
