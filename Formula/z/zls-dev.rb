class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260816-161651"
    rebuild 67
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "40bf64688e40474a2418ea63f5590ef3b4f79a3663ed2c1f201fcb0bc443e5e1"
    sha256 cellar: :any_skip_relocation, sequoia:      "32aa1379a33fb4b1592f26f3c9fc8965b72ae58d5e29da57949edf7d999a318d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dd3246eae161dc2a25a2d9b70d6e0af3de50e6fc279570ac9187b483696a7c3b"
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
