class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260517-023823"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8ae3392883509976859ba458df6e7a8189029481c915362c9c92203b9edfed1b"
    sha256 cellar: :any_skip_relocation, sequoia:      "81518048bb035f0c316d85521572ad13b3d88949f8cdaab45ad7151a30d7ac50"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "eed4e631b15ddf3b108995ca8031f57f65853dc0db8576c599538eff6f998889"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f32cbe90b6ec25e34e2b41091c66bcecd13cd4691bf6be0bb2e183b6efb78c4b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "78515c7e03506fffc55c9105883421f5e02e547a4f4ea86ee2e198ed129bc84c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "35b45caada95b02f723f642740d750c1053911c440c3bc48a34112a7484d2d92" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.38+ae3ab43c.tar.xz"
  version "0.17.0-dev.38+ae3ab43c"
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
