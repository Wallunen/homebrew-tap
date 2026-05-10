class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260510-023104"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "765f1dedf7346a132ff059765855aeb18760bdb295d36481d0de37e8abbe25e4"
    sha256 cellar: :any_skip_relocation, sequoia:      "3de3be5377d1d13937597f23b6561d9f3d195a26f0e682dbd44002e02bb4a164"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c5c580feae84826b47a1f64aa5cde16c33160402a06966da17e3a4afc8078ed2"
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
