class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260418-163314"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ce78bdf21ceed399d12c130633f1db8b5fc1550aee71cb5f1bd98835978bff0e"
    sha256 cellar: :any_skip_relocation, sequoia:      "2d11406bd2bb5510b1014f51d0f1b1bd15fcabc4266840940b92c0325f8ba133"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4063dc6c1a78346329d639e28a0a53b03c8f6751e7bfd15e9ddfe76f88b14a68"
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
