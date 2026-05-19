class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260519-105724"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "49a0bc36e77f59db3878850a889d434be89b26faa098a0e2402c865e4c7a0cb6"
    sha256 cellar: :any_skip_relocation, sequoia:      "c596691492917fd83d0b19271b14ca04380ad670f0ecfb1912d6241a86f993cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3589e0a38e41494b0f24f48fee8b34b2c3e337f1b425df33c93ce1ebf415c7e0"
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
