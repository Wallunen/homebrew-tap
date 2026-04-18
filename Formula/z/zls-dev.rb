class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260413-095032"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3bb047ce00ea36c2af445165ae998219c92fe5832f36fdb1b27659dfb098e702"
    sha256 cellar: :any_skip_relocation, sequoia:      "4f366f05bf9ecda0dd034698b81741b7b8a43e11d3cfa9f875fc64e7f32df9b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27c101763791b66e791ffba1980f0ec98287ec9864f8aab60ec4839ff4b0e58f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "49f716ea96c1aadaecaa5d9c0a50874cbcf443dc42b825f1e7ee35499ad3eb96" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b93ec549f8558a7e85984a840e9276d274f1059b54ade4254296ef4982958359" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ded6d562a0b86ee878b1ddf70ffab2797ce3cdca3b02d6077548f9d56dff96b6" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0.tar.xz"
  version "0.16.0"
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
