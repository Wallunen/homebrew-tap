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
      sha256 "0d637250297833234c44e66dca71455cae774659a9537aad6ccabbdab75b6571" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7284f4c3dd6efc8881225fcebe45e85f77c999748d73f895e72d3c6fcfb9fe8d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d3cb1d1dbe825ec5cb924b0c399ce0dfbdd27a61ae1097e272bee9f1ca07b311" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1516+8a4b5424d.tar.xz"
  version "0.17.0-dev.1516+8a4b5424d"
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
