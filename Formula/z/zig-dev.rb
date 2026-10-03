class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261001-204432"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "539906626a3ab0a4aa4a7814e7f8308b6c049214e6c206bdeb58d39ee000a410"
    sha256 cellar: :any_skip_relocation, sequoia:      "0fdecce89ac3475658071e17aa3e70f8b34cdf0d41e5f1ce322bae07f724c6e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "90e272194732e438c58b26e0b2f91b43f46d02b625477406b2be6631e82437ec"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4f9a1c5269aa17ebda5e6d3c2b89d6cbf36f7d2b22a0306e9ab98f25f95529c6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b607e9b9234790a008116ae5bdb71c6243b84b9fb42a53a9e70fde41c06c536a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1cbe9df9f27e6b78d14ccbca43b6703a404ef79ef1c463de901d7f088d4e2026" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0.tar.xz"
  version "0.17.0"
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
