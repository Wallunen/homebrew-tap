class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260730-101850"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "28fde2ca5d84ddfe77d275dab8a82ecbcc743b9423534dd30bea27fee49aa031"
    sha256 cellar: :any_skip_relocation, sequoia:      "61b9e74a63522a7b397b2578cd335c7236434695d44266ca76c0fee5c57bf0ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "29670f485ff5e6a0a7692775e67f7e5c01c287f80c70d3625fec7302c94b337d"
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
