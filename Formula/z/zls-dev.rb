class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260706-180645"
    rebuild 28
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ce6852f7f88b5a0f70b94fbef0e323a5b3d00d4abc5654f31c8d59e27983ba34"
    sha256 cellar: :any_skip_relocation, sequoia:      "dec176e27f2e8ab4d7052819cd9a5d84860ae000d49f3dbfcee97b9adc0c4f6e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6ecc085bc3b2c6ef7879b0a1fa67e480e77a360a640b890e3f99d90c54c70b5a"
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
