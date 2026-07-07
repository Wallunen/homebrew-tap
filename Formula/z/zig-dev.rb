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
      sha256 "7b26b0866fd01a7ef13ef56d01519882efa06b8685856fd5efc48c16dc25c4a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a056e3912c3ce48b1f43df2af38968fff9eeebd0d028af31fb31fe74db09ebbb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9708590c4761a8fb37b12f62403d0fe2768c5380fecb106041990e336f5f4cae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1267+300116b02.tar.xz"
  version "0.17.0-dev.1267+300116b02"
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
