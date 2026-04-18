class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260418-015601"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3cb92e4d29f0d9f8dda3b94b3130b882b6b0fdcbee9f11972767e56cd1d2c461"
    sha256 cellar: :any_skip_relocation, sequoia:      "e4eb538c36322f06211dc96aba4b8c97ae638effd1db3064ed036e9c17784e06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f9dcf4bc5cb3ef1b6caa533c072c9371ca2f02a84645032f315d159e034cef3"
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
