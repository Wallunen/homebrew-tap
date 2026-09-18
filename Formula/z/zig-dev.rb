class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260917-125806"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8a356be73858e48b0ff6a605acfa24e7c8beeaee494b5c7ccc446db21a7110a8"
    sha256 cellar: :any_skip_relocation, sequoia:      "69b822831aeb6562303b53b8b6a9467fb3ea705155af3cde2ae3ece41d83bd88"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4382e94ded4d3e1a9b29bddd625374531f3b3c280a81d4a8b634e0b3164403b5"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9a4e4ef3dbeaa88ed33b2296835f1b61a4f66cbedef485bfab95b83e1072fe0f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9613b867f218a21be7760f714cfb3f18ce36fec85d2051f4c26362b495f2face" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9cd9070c132370202f5792777f957ac3cc14db063595db0c3abedebaf316aa12" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2163+89ff10d56.tar.xz"
  version "0.17.0-dev.2163+89ff10d56"
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
