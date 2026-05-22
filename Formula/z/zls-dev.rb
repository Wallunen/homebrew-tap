class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260522-174737"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c09d7698253098c8768a5dd4c1d0a5fe31702dc5347782753133ee3f966d454e"
    sha256 cellar: :any_skip_relocation, sequoia:      "3904f1b61fc57e953b8e49b7ec506287926ae9644756fdd3650538248e3044bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "28a508b4dde39de1ea30c223e5b8036d082c930f82bf1553fdd4dc817f471307"
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
