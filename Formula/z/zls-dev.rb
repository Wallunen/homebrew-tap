class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260514-101013"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8ebf2b89ef45da8b4c4494190ede9ff8f80b01ea64c0629d1acf81dd0fa5f156"
    sha256 cellar: :any_skip_relocation, sequoia:      "7f1ef9482901016c3b2c90d237ace9d85118eb7551d9e675d3ee0f88eb1b0665"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "10d1407724e228b48af5f2bc0adb140fb7d5289fae1f719df48741ef2f183e88"
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
