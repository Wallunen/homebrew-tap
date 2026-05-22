class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260522-024942"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b0d85f462135808b1614443165a28c1e35872b4d739a5723162b5046e04ade60"
    sha256 cellar: :any_skip_relocation, sequoia:      "e9820606fd31c1fe51ba440badc48633c2c6c550cdf75dddf70217ecc2c5cb6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53213ae93f1bb12f02b23ce6875c67d9a6df95d5638044f1001e4052ac0a9a72"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3d720ccd092fc81bf70824526425dda973f70d3121ba383859083b8f81f2d444" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5e0076f08b65f2deee1c13826d1902fd40d866128daf6f8467d615f26dc94c57" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6afa4567041c983ffd95351679e460d654e7317647792275038ddab737e7124e" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.40+d5d31d9a.tar.xz"
  version "0.17.0-dev.40+d5d31d9a"
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
