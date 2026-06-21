class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260620-102838"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "11583494224ee48532b672c4db56e2adb49ad644a95bee320acf89f86bbfa0a3"
    sha256 cellar: :any_skip_relocation, sequoia:      "eb5c27ff6478205f044f6915fb696fdf0f110616cc34a58da4ed601ea205ee2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cc64dac5c6fdbab8f8958fea386fd04059a16885a67c5f061330695848f73e13"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "db78d16e0eb6a1224b006ac4cdce2c5b9317953ca1dff50aa35ce8d27c258469" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3eb3155861a9a3330b3056449537b818461f187557377622621b3ce3bed7a47e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eab0b059fd4340f74afc2e60db86342bb9bc772250f1ba9c47aee7a0b7508f94" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.931+84f84267c.tar.xz"
  version "0.17.0-dev.931+84f84267c"
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
