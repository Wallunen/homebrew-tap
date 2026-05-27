class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260527-025306"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "46010e28eb0cccd6647a97410b3c6142b1c38be534c95de66acbc47e2a310cba"
    sha256 cellar: :any_skip_relocation, sequoia:      "61ae34a2e3fd9ef96a1ce5a542b461ef3681d060abe9e55b9ab6de52f13b8966"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "694f8fe2c40269b89865839259d3512f0548e36f9f8928704d67ec2d33aacd12"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4c1173d2f6be21c26c76946ae934c5a1e0ae078d3a93eef2005cf73bfed60c3f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8a25dd0dcd57ef7050e6e07be2ad03ec777b793a7689275d6b6cfc8980f5a2a9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1915de5522c2fbea68d1b1864b230d9a25cc5d257312d960c895a8359efe9c70" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.387+31f157d80.tar.xz"
  version "0.17.0-dev.387+31f157d80"
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
