class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260508-023459"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7c76daf6d9b990fdf88f7aa1f9198917af5b783085a0f336a07bc068c24ed8da"
    sha256 cellar: :any_skip_relocation, sequoia:      "b6d484e2cca64cbc7c26f396df8a1e5310777c67bcec7f2188a722dec623b52d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f2543ef4ae460518642a1ebf0bb238501a65d1f80ed6dc442960d837e0d9a83c"
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
