class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260705-023544"
    rebuild 26
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f5c71f57e049eeaaef783fb5d1e03e106329773c5b9c1cd1314856565dfdafb6"
    sha256 cellar: :any_skip_relocation, sequoia:      "a19a7beec02af76b3bdbb591b70bfcdf27c9f554ea8ac5840eef8c63c82046cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "07f5f7c39bc14948d3c5987ec3759adc41b401366785d3979a1b82cc9d4a795b"
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
