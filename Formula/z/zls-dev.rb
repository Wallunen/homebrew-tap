class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260906-115237"
    rebuild 88
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "93fba4b8e999a9dc790b0289bc0d5eb36f5d418f385ef236b24f82c80165b10a"
    sha256 cellar: :any_skip_relocation, sequoia:      "7a5934c2a3c15c0eda65665b45f5878a3f0606db8bc1d621fbb6c7d80c57f28c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "08a685e5e35fcb83b3e4e0550006ff056562d6c5b4c1980ce1d603d18f5a1514"
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
