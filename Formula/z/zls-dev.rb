class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260420-165916"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "78d2263df30836b2a49cfdc474b6759e506007204462ef20cdfbeaee59d86743"
    sha256 cellar: :any_skip_relocation, sequoia:      "c41339d2f78979d0fe2abcc2fe37c900ebc5c3d6b8b5b62bbc7e455970ccc2d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9bf18790ad0ab6b6a5fe44a350b07dd617a6ef3ccc5b5cfd18a78a9edf2c90ce"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e2cd1d1a80f00bb5f5b2b13e41b0a3ad3724d7f0adf37e5e74903cc7b45b8220" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0f89ffb7ce48d3a1d06c58253c7cbafc4e4e4d30a63f6c7d77bc6eb234663bae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b17ea858f2fe7ceac76b6530c42a3cd02be4919cd5bb73e1928bba866ec3fcde" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.1+295cedd8.tar.xz"
  version "0.17.0-dev.1+295cedd8"
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
