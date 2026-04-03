class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260403-163420"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e061225072369d9dddd192102598736546995c14cf94e6e305fb5f0a7e1595c4"
    sha256 cellar: :any_skip_relocation, sequoia:      "343b3896f1adb725819f052737ed1eb72b1c35d6ba9e5e10e5cbb8b963cf45f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f3979cf3e45445eb5f879f04d4374e24a21d5d5b687e1a8890888b74cf573ce9"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e53ae91d577ac217264e4790e78b0e60cb4b647e5edbb3a1b17f039e103b2fcf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e1756b20c980e2076dc8b7d6aa435eb060d784893fc43481f6e0aa27afc2efe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d1e0c1f86f9e5268c878630ac76f04691747c7c81964e165a9fd02137700ebe6" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.296+ef64fa01.tar.xz"
  version "0.16.0-dev.296+ef64fa01"
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
