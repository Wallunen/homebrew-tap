class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260606-095827"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "79b4dabd333b34116202016a1cfacd423f8d0e8bf7078eb7050d6ed717745986"
    sha256 cellar: :any_skip_relocation, sequoia:      "7cf0170b4ff5641adbebdbcb0d47442e54d2e38a293bd56e13aa963089b556c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e8c7f79548503778d9ed85e56421af4ae1bbc27c8334a061bf878e409e754ac"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f2e1a435003c9f3b06152c1f41e1cfc0d03893d2ff0387a042303278c01f0b5a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c0756d4c0b116425f7aa254d3fe1b5927813b24fe4b44305c5bdec235ac98ce4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "17eaceaa1b7187ed34dba86a947151d0ad0c5e5da010293473d519da2535b682" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.704+b8cb78023.tar.xz"
  version "0.17.0-dev.704+b8cb78023"
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
