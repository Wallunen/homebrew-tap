class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260707-105001"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b3878603488f43f04cb07de328d0ad89d9d3b1eb4f4e9ce554ab78abb1858434"
    sha256 cellar: :any_skip_relocation, sequoia:      "e82c99472337761e1816dbaf653f4358a6f6f7ebba04ba516ac59086e7e20698"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b7909baa048bdf30968305ec45f832c0c06592add97b919987cff1dc0240252f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a4f73cfbdee89168eb493eb5df1fba4f1b7eead376d56a9f2a4c242ac13cc725" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cabf8db92c381bda5a160fda8fa54ffa64f0964316c0d5b1dc385a7437e1691b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "04e8baddd0497042889d3ee9ae53238e0655c2b9777039827b131487a7465d16" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1275+59a628c6d.tar.xz"
  version "0.17.0-dev.1275+59a628c6d"
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
