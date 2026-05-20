class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260520-181216"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2b6d7ecedd303456c92a320842716ab42cd41d1f330cf9c0f1786e1822848b33"
    sha256 cellar: :any_skip_relocation, sequoia:      "6ee610a9b3d4541049f4b1cdd8ed303ddb41574c5698dfc5b0267a6e6317a5f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b72612965a1832edc423a1ab195717cb49ca6f06b06672f32d1c9975f4a3996c"
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
