class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260914-143907"
    rebuild 95
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "706b819d7769fb59b2c4be6d32cbe39de1c72e19ec811960a0bd4aa0dd0a5fbf"
    sha256 cellar: :any_skip_relocation, sequoia:      "19b046c9a59340ea5a9248ff8a6a64d5b41d0b8f363d851394db78ea8a4b513e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7b9bd2c6f4a4938bc50fd318da6f065ec7c21f1284283e244aaf487585e9cfc7"
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
