class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260428-100820"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2681b6f3457987874ee411bebe77b99d19147765fdbbb4752792e0c2f0521877"
    sha256 cellar: :any_skip_relocation, sequoia:      "36deab76dda64b18c6eacf0fecf05ee9dda6bcd0d37af6285e2663719c31a7d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c32751e529cb0db2534bb7bbdfa0c6c1c923b9432789b9e4d6f35a86bdcb005"
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
