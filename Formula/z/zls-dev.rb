class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260518-113937"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c34a215b0b4fe8c8dd8e84528813057e0657bd987b7598bca5c46572beebc82d"
    sha256 cellar: :any_skip_relocation, sequoia:      "fa86e532c5a9098a4e04af2f6940a5df1aa373b96dc2f2ed34db7120823ec236"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3e92412dde6be7b36ba040f452d7bdf4f001fdbcb8033310c33b93fbc1cdf597"
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
