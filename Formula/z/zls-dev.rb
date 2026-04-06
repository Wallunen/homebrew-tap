class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260406-020130"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4ffd44c1603237494080098893f6a92ec4fe4eed1656d1d650c181a904e94ebd"
    sha256 cellar: :any_skip_relocation, sequoia:      "543d07ed77d858e5695f5aaf1c25bb9f91656917683bd0f05556f86b9ee35664"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8001f74cc9e39e69812b39862adf76255acaa04788a75dc3b35a1fc84e2230a7"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "03d02666647602e018868420578d3041d5982a662adff4a5916b7a16ef76fd29" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c152a0fd95f01f04dbd82701974e31b9221a1f2940627582c687b826dbd199df" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dc9605a17008a56f4a36070a9df0d0485010a3fe5a2b781efd45dfa925045f72" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.297+42800187.tar.xz"
  version "0.16.0-dev.297+42800187"
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
