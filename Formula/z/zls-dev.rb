class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260505-095716"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f021e08533b66d1237d60960d3537ebb206595c510b090ffbfd704d3980bd22e"
    sha256 cellar: :any_skip_relocation, sequoia:      "3d15a4691fe634351f8c1adc4b92603b5b0de39195071bd44789afa119ea9aa5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8aae614abed27f7f905706f10333ee1d3ac70c8ef83daa1454d9be703cafcff9"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8ec9f5720a634efed800f8887c3616f3e1fc87c6b9f805a14d0b69ae9546f0c7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0363406fe2e7af3f8758e345f4693d954feac7b619e4c2632b1f95c918eead00" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "16996c48fc24adaa3b26249d7c1dba0aa5eea10db15d6c1bba7c7f3c1bab7fd2" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.21+5767f2f1.tar.xz"
  version "0.17.0-dev.21+5767f2f1"
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
