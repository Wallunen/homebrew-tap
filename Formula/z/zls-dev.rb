class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261001-034220"
    rebuild 111
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "14998ac41a18007d8e9922b558a57f4b0c5b4894ea0ab1e3a9d7947e84a75411"
    sha256 cellar: :any_skip_relocation, sequoia:      "560c01e6d7849f48ba7d23ed9bd4a72f267cf23964af1b9aca642bf6cc418e78"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "283b216b51a1e2a6659d1b31703ac95f3e54790f4cfcb22cd935a14a4e315d5e"
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
