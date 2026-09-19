class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260918-123639"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "edc31b340fd1c1c91de1a78baecf52b876541b92c907b94b88d612a6c445a1a5"
    sha256 cellar: :any_skip_relocation, sequoia:      "926c36ebf1f2e322c0593596c5a4447fe3746feadf95c6e6ec65326f4458e88f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8f3295d3d23d8720172d838aabb3f64b92e6f2a1ae741d1f71c198875e3c80d6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ab349382776df44c6fcd76278c8c750a765000bdcc5c2edc0f0fd52557b8b69f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43a882ac4704d30685928d3c4f3c7d62b4ce286a875df88bc0b206931bd0b0d1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ba127e73adeafd25aee6a16cc6008486c93ea0fcec5bff9d7c6b035785b22c3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2228+955228b68.tar.xz"
  version "0.17.0-dev.2228+955228b68"
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
