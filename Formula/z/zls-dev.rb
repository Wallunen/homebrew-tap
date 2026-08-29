class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260829-002007"
    rebuild 78
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bfd1223f2ca06ee6f6a5248e829ce9826b242744a62730c5390ecd56b485ae48"
    sha256 cellar: :any_skip_relocation, sequoia:      "a3946a5c52694fc40872d88a7d304dce19aece29d59e3fdbcaf0d1abda5d9e93"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f3787b810cbc22f668bb2f8397d1a4e540c8591e6c8c955f17548030d88e1e0f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "477e2cd6440643960c4c372c1d14c35d7093cace526fd08c6c072e091fdb1785" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e14170c554c2306a17402a81c9058915c36f69282504d4dbe04b2ff1d3c380cf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9ea223fa88424671555911beba5d689191ae080a4e827ef5c76c8f64e39ff296" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.44+8da87d4f.tar.xz"
  version "0.17.0-dev.44+8da87d4f"
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
