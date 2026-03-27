class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-5e3f6371"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ed73ef61fc672e4a10663efe15be0385671774dd1cf247294e20b0d42460a2f2"
    sha256 cellar: :any_skip_relocation, sequoia:      "64a9db3887e50fc1e2c8a74bd4a6622261928ede27beaac12cd772e39f40ac9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e1345b989811e03017583364ea7254ac939e28e7c4700c96db165050725ba18d"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "22e2b1d58bc003714ae8a89a72303857b027a3461a015d6892be6142c2fe15d0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fa3097d1cb118eaf18cbd3d9ec4a8432b74ef275f77f554339db6205253c12ff" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0fc57f76fbf8639de0a2692584147e942b746a433eff62dbc4b53ec1a488b73d" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.281+bde49ab4.tar.xz"
  version "0.16.0-dev.281+bde49ab4"
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
