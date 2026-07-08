class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260708-101109"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d52e6f1188ab5ec3c79b78144aac21091fe11042a4e57a820c79fca7d3865bb2"
    sha256 cellar: :any_skip_relocation, sequoia:      "cbb3bedcc612aac8a6f3fbea297f8f49df894fac3228253cefa7f1f38d3e3166"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1503208f5c3cb38f341d7b60e012a5ff905dad99d3a7c7f06b54f3d55e5c316"
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
