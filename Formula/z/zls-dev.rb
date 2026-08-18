class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260818-082831"
    rebuild 69
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7fd95f40e4000087c1801346f6860b929589274fd70cb1cb7c5d816266b4edad"
    sha256 cellar: :any_skip_relocation, sequoia:      "ff74a0eca02e9e5c54a9ce7b74f3b67d47f7965793d1f5c5aadbea8c5b128d95"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c639c1f2db1defc061b71b7e22ee64497cb00b016f274c9a4bd901a0a1ad0cc5"
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
