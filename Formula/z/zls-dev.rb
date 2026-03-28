class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-e584307a"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "567f30e5cc8f5d55a02e9a7ed60ee63804ec5f66b433dad1d0ee1b95b28d4682"
    sha256 cellar: :any_skip_relocation, sequoia:      "58896f3b85721c49c91f54315c85ad5f0266e12c137cc244eedea06deb43b309"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f616b590e23bc45852deb4df9dbd48fdade717b33f200e00e0bedfa2567ec386"
  end
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "668d485f8b5df33e32a8df93c431483fa9864b9bde0eba5bfdd44bc37fadbadc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0422cf368a3164e38a7bfebf1db1a5029ab6f9242cd2a18d7b265a648985d50b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8ecab5a48d483d3b16da0900e4a64ab402f73d57c9fb251f9543a5aadb43d2fd" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.291+74617193.tar.xz"
  version "0.16.0-dev.291+74617193"
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
