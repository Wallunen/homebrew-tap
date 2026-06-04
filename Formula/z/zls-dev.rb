class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260604-181105"
    rebuild 8
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ee187afd3078736a55573a810059b7423ffcbd5612395a9309b43c44ddfe2bfd"
    sha256 cellar: :any_skip_relocation, sequoia:      "2bbb45d539a9d6b78a609ca7f8b9d92652bb35d6dbcdbf862337c31ae8ed1572"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8074a0a33abd788e5a14e096e2de8e7c16836f6e23f223f3f38bff0c13f31e11"
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
