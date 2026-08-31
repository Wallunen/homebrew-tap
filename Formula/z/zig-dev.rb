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
      sha256 "0cdc08fadecb11d3abd78c0be006a02cfd03cd8e565ff1c84e12cf9d9916baf7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7624bef4c57dd4608930f77334a87778f9335a8051d562b7b43ecb254d683489" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b2f6b2fa2cd462c10c86fbb160099c1c8848d2d5bc0c1e0c2dc28a73313902ff" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1941+71115f0ab.tar.xz"
  version "0.17.0-dev.1941+71115f0ab"
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
