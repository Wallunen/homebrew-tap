class ZlsDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260502-021202"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "20723f0ece10b36e89d3cc2e1cf2effd0084af5974768d94a2bc556b538c9e5e"
    sha256 cellar: :any_skip_relocation, sequoia:      "18b5a2feff53d8315a8f4f21e2c54e0c8b823e008ecf995fc55ccc95b5afee95"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6dd28ba4af425f8f9b61f5c495e003d957e06497202097e4066310b4690e3a8d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c619f99412571628805743b1c26ffeb1041a5f1925461e9c5169907b684a80a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e4e803534bf1e05fbb1b211fab6983880e67256fd46e361c63f27836009d22c7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "15e703d4e951d6dca8824250e2bdc8a41bf04b707389d74f75d82f8e8b4b03ad" # x86_64-linux
  end

  desc "Development build of the ZLS language server for Zig"
  homepage "https://zigtools.org/zls/"
  url "https://builds.zigtools.org/zls-#{arch}-#{os}-0.17.0-dev.13+113f79a1.tar.xz"
  version "0.17.0-dev.13+113f79a1"
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
