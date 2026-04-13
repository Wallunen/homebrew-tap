class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260413-095032"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "3bb047ce00ea36c2af445165ae998219c92fe5832f36fdb1b27659dfb098e702"
    sha256 cellar: :any_skip_relocation, sequoia:      "4f366f05bf9ecda0dd034698b81741b7b8a43e11d3cfa9f875fc64e7f32df9b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27c101763791b66e791ffba1980f0ec98287ec9864f8aab60ec4839ff4b0e58f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "efa1ecc18ec1712e586e4bf1b0854eeb7c0ca80f55b65ada9fc300b3ffd75ecb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5bbd24fea23ff2f57c2a4a0e854a3285f38f451fbde46f7fb1e01716ed3c1cc7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "af74e603d3d592581c91fcc6b2aeffbfb56a89169c831c910a02f02f91e45f9d" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.16.0-dev.300+f391142c.tar.xz"
  version "0.16.0-dev.300+f391142c"
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
