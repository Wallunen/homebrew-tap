class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260723-171413"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "6a51145c539270fc43fe95ea8878abe58c45de8b9aadd9dd2f118b0e67e1bacb"
    sha256 cellar: :any_skip_relocation, sequoia:      "f87cb95e2cc2e877b8a4740aa6dd9ef2b1d67bfea655ab8acd6d77a7da74d68c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a78b129f254383ad8d492ef24900140db33bd677ec7848a1621e6e1685db4a1c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b2899e55265abf3831fdee9a464cbf915e4c050a8e9181a683a3934a8af151d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f38864d780367664426d8ba3b87dab2005d9ca1add5558a321d62118ba87b96b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "555b89287be3f187f38a6a9727801986c51402def38a89f44a6cf404dbe7837c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1454+5faa79730.tar.xz"
  version "0.17.0-dev.1454+5faa79730"
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
