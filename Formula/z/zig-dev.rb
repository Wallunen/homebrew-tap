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
      sha256 "8fd4c9de8d97626388e38cb4efb523dbc64dd3452d0ab83f829417f7b99f31eb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9eceb97df77aaec7b8873fe24f74783adbdf0b88e867547e2ea6449f73bfab67" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "15b4c7b9e20883483b94a83bf9da09200c2ea00e7f0741780f3babcf1b460d2c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1503+1f1bee62e.tar.xz"
  version "0.17.0-dev.1503+1f1bee62e"
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
