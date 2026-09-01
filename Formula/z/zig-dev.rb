class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260831-154522"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "eb7c42971548791bf710b0a88d4265ce036a36d193c4e0b6439da9f258e055e3"
    sha256 cellar: :any_skip_relocation, sequoia:      "0996b20200a2b871390e0702320cdf55021e93f6e7a082594c9719320bb276cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff58c0087f3d967d330fda95c420f2ca60c4431dec4b12c02509085ca526fa11"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3753b74e16ad424bef7d2854514a9dbeda119237e3af576528fcde5e61b0c861" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f1161ba152c59fbd27e2e5487b55f2b661241e6f8539b374200c384ea88b7ce" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e5ddb09e7362aa78e333f4bdfa796b5c7fb7a99b8e68bdd9b804b65831ed8adc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1946+d813faaf0.tar.xz"
  version "0.17.0-dev.1946+d813faaf0"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
