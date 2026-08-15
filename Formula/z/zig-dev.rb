class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260815-005440"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0071830068794178bb6788c2d97576b06f4b280ca08d5d960619c1e8231f52e6"
    sha256 cellar: :any_skip_relocation, sequoia:      "e661192a9fd850d8137733e405bf73a8a525750fdcc946eaf96ea9e213c163c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "50c06263bac01a821309fe149c2b176bbd9ad31072173f95e003802286fc2b59"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b53d4468959a5fa31ccf0107ad7e249ee1b92ab2e2e4cf6445db989c7b23eade" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3165ce76d7a25b246089f05d76bcd4c371eefc4000e151ea392140748f8d6161" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "81af6b0a174949f1a7c197e5f1ea1a4ef5f867d3c3ce3580b4d684631a5169a7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1756+613c03321.tar.xz"
  version "0.17.0-dev.1756+613c03321"
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
