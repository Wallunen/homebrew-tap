class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260605-174905"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0ddb383e4133e2c218775adfeb3213485e434ce31657933903f44f1b8593bdce"
    sha256 cellar: :any_skip_relocation, sequoia:      "0bfa6b0e45e42058ca93d4a14721ca549ec0e8bef9bb1b5440db880d9057cf01"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae4c45c899277511f25ab59ba40d7f4f7563fe805a07ddd7201866a4b9406d28"
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
