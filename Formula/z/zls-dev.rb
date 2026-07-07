class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260707-105001"
    rebuild 29
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "019db5209a1480b80d1eebb6477727ca382d7e50f0bc22272a9e4ac7ee5b4b5f"
    sha256 cellar: :any_skip_relocation, sequoia:      "23ccff4d73f10fef102ba47668b2ea025dccdaf5563b41bc96bdc85ca3f4b89e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f1ac110f8dc01db3e1649d23611aad0213255e7c5911bb7d8a9230d09371e56"
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
