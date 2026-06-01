class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260601-133113"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "da09ca344d5b3d825c5fee785e4c0ec8789e3ac571ab823b7d2c11fc1e893ec4"
    sha256 cellar: :any_skip_relocation, sequoia:      "5b830d627fa46803b062f864acb1e49a491044a7ca7f6ffdfbbb3a6c4c4eaeb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d05a74689de27646723a178f9f1f0b23ac7dcc680f39b3f15f0f03f9328233a2"
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
