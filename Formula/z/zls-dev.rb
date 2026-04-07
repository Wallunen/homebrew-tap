class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260407-015732"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b2d18abf22d5802dee0a2c4d423e9ae1b861fa09ab391de79b39e6ba84a3c2b8"
    sha256 cellar: :any_skip_relocation, sequoia:      "66b7478f52aad3a65f1377b4acada30980d2b6454b51158b689211f8be8e1f60"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf230b31a908273569208bf1573f955653c733cdf06c9e22b868abcc886997aa"
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
