class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260407-165131"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1f534a6a3535dd0e0392ad39fda3f8f49ff6f5212271ccb5bd29eb4f8a6933da"
    sha256 cellar: :any_skip_relocation, sequoia:      "fdce772b409329dd127328c41daec8c9efd0c237877f9219659d0ce55ac92af5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9abe51dab46fda5ae6c849393616469dd552c6440d53730dc7de2432c3ccc74"
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
