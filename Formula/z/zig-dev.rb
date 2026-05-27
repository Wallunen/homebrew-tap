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
      sha256 "4c7e66f86e7da1faa7b8d1121b73d08fabb9c7859cc5a9201843a8a61b8deb0c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fbcd8ea6c710869b16c413ebac840c5e2f95a97eeecc956ecf0a552ba346f4fd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f5cbe4a5ee819a511176f6ea352c9ea355d7babb4dc74cb17172386473025683" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.389+f5a1968f6.tar.xz"
  version "0.17.0-dev.389+f5a1968f6"
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
