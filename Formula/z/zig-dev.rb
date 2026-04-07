class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260406-020130"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c6d0dd5cbd85af178caa007aa8b2efa314e458a46a159837da86c30d13b096b5"
    sha256 cellar: :any_skip_relocation, sequoia:      "76c6dfc6cbfd15391ec25774b5e717d56b8f6fffce7be345abe957fc60f36658"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9179d96f7444f598256cde5a8733a7d1a0259ba296d7d6c3a2e7a804c335ebcd"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4c8240285fdd78d99d46e80b3f3aa9e39d07cc870ee08007299b86b05b6b029" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ee7d3d45abaf1f9dd3584ae171ad97f3d8d803201eca940a8b3a9e008a06adcd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "17f23d710fe48fba6d58f62f4091627eaed7ca93f74e05ef22788d7f796b869c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3128+ad7a02822.tar.xz"
  version "0.16.0-dev.3128+ad7a02822"
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
