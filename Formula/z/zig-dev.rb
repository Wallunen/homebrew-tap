class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260729-170857"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4d9d202fa28480e3c2e7af70781d89e5e6175a3b9a0f0e2544c1a87014001b4d"
    sha256 cellar: :any_skip_relocation, sequoia:      "5e27ad499f68018642040455f538f90e1ac45621fed778a6e5fb9bbaa635dc62"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4391d59eb91243d340ce47e5b49051d685916af782859ca9ab75d3bfe2765ea6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "087aad38fead6c0ba7a52b5db3c405e63708c4765eda643d4144b9e4933d45e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "24bd83c1d435b8ab6192f58afcc22f4e5252077a938ffbc35eaa4ca97c5be709" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "48cc865b8b410ec84eaa97e50c2bd7a657871802ce3aaaf04dd1da2294d4b28a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1509+bb296ab9b.tar.xz"
  version "0.17.0-dev.1509+bb296ab9b"
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
