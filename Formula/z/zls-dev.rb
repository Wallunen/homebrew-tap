class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260807-022331"
    rebuild 56
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0b0ebc949bab77e0fefe5cde12db1c08db7754f4ea3ba909d7514d0f6fb54b65"
    sha256 cellar: :any_skip_relocation, sequoia:      "1e91be666c8f645fb0e6987a926c1d1d2d58c5bfded3a6a9be995f97f72adddb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3ca8116a86421131961bc70df7de2df5594d671cc98672665a3d4efd8b72ea9d"
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
