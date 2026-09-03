class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260903-190138"
    rebuild 85
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5cc4f7e884578bcccb8dda4539f1f0dd536758d1e141185ac5ad0c51701f43ba"
    sha256 cellar: :any_skip_relocation, sequoia:      "7c7a280c6e6a1712ca74dad2a71e5f95e32f328f86fa4f314f2cd934df804fb5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e25b333e6ddf3591e76657fd91d7cf8b2b6913a908ee09499c3298ef46a4aec2"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "477e2cd6440643960c4c372c1d14c35d7093cace526fd08c6c072e091fdb1785" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e14170c554c2306a17402a81c9058915c36f69282504d4dbe04b2ff1d3c380cf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9ea223fa88424671555911beba5d689191ae080a4e827ef5c76c8f64e39ff296" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.44+8da87d4f.tar.xz"
  version "0.17.0-dev.44+8da87d4f"
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
