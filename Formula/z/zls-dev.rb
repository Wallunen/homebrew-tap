class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260427-022302"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f3527c37993a251fa566b4145991e5f7af654525c91fc90a22dff8baa3deabf5"
    sha256 cellar: :any_skip_relocation, sequoia:      "1514056a1745ac57a52475f6c5718f6a84462883f00f69045b779d031ebabb8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a1e9e0eff523b9253e0b866dfeb6297384009d5241c6c455f808786c99b8c61"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "078e3d1ef99eb680909b2ae73783f7f3ee3feac60a82c7b2fe1f0fe7be28b341" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d88d1ce9f9619d7705c48ad4a1f59c0d766eef9e5c8b9f9c84064db09aaca70d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "329455570eac1531e8b0cffc3a39095e7b23110ea6cd802dea8bfd92fa1d637a" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.12+dc282df1.tar.xz"
  version "0.17.0-dev.12+dc282df1"
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
