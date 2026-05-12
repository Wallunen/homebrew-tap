class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260512-023332"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "def995d7f8e89061e7da2af27e76c6c5d74539f495ba04bbb123228e13fa8641"
    sha256 cellar: :any_skip_relocation, sequoia:      "ed87630a7c340c71eb20a2f669387c3515992bacec8fcfbffc52e968495770c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "453273234ed861dabc0852d51348e4bbacfc71451da74b726854612d61270576"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f716e1eab0853cf84a9001fa35f6339d3792b4db5e4a6e0ac79d10b3a7e68da0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "eba6ffe90d6932b49b81db452dc759cfdbbed59dd898b95331cbee7dcf261601" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9def546ef6f470e47dd5da58490d1ecb075e42731cd8f8e0381bd95edfdb0918" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.292+fc1c83a36.tar.xz"
  version "0.17.0-dev.292+fc1c83a36"
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
