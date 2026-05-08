class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260508-091140"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "09ccde8f483cd7604f1adb2c8f8b974d5e59df5de0881be92c2c276e115d7dea"
    sha256 cellar: :any_skip_relocation, sequoia:      "a36a1a0cd7620792cb56604c77c03d9df77ef992c6cb58b3bcc8f910ff5a1605"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f3a038c3a7c390fa1df6ce0ef75d3c7d77c067a0df047c574a723580b4b57a6b"
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
