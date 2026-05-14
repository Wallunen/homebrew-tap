class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260513-175703"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3b7f767232ad45a38d506de3255bc5f260cba7a090453c17b64af312f96173d1"
    sha256 cellar: :any_skip_relocation, sequoia:      "d4b46e9d6feabbf16b902bd7e52b671c0050abcb899f663d15277aaf24071ff7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "96cfd34a4ba2d61c1216d805bf31a78e869d41c2ace3bf630fc0e4f2cdb06e3a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "711c05cbaa155c13034cd2ad2beeb7de05c487340ef6bf2e53b4f0392d4c0b08" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "674d0f0a238aa2404f1a3c0bd31730736dd02d65572de548cbed51efab70d19e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "15b757a5ed08c4f90e75d1585d2d4fee4cc07f16e03bc5f7aedef26ae7446f79" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.36+f0bb3d27.tar.xz"
  version "0.17.0-dev.36+f0bb3d27"
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
