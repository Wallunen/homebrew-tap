class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260702-024540"
    rebuild 25
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d1cc9d0a355e8661256b0dd9dfea177bc6029e26653878d91752917ef9ad260f"
    sha256 cellar: :any_skip_relocation, sequoia:      "d92c2f7e51b9b172d910b3f7beb5fc24acffbf906c536ffa0c73c86a377a49f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5e425e93b4e78a5e5579cfd68f9a9e2fd145863d968628d07e61fd36610fe2c"
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
