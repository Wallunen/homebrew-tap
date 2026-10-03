class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261003-185629"
    rebuild 114
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "02be1d9c0fae5e616dfab73a7967a51c2a898599eed59d6bec5057b48ea002f3"
    sha256 cellar: :any_skip_relocation, sequoia:      "22fd2fbefc820ae485065039e634d0e6cb1b9aa0d2a50d76927e2cfb6f7ab831"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d4452056aae8508c7fa7736a736a8fde162f7fc4a6fd18df41f4b9b12c61f05f"
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
