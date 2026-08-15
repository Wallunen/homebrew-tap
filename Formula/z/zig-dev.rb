class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260815-161641"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ddba3e853fb8093e42950d79831bad3c1c1c15f1abc67a68b2cf2086eaf10ced"
    sha256 cellar: :any_skip_relocation, sequoia:      "9e3262a927d31406dd4c0cf9729e226c9ec3bf9caf04da261c0708f5c2e43f0b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a6a103524d1306162d898dde14d284286d3ebdf2d087e75ecd98d67e5b8f6bde"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ed0f341a7e49e17d446cc2b71e8f17c4a33b00a6d7a6c4e99d192d375ca0597a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "784cd97c78a999b01b6feccc4ef153406544d82643c3bd74ed04a1314c673de4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1c58dd1d03b07410bb865240dc44799cdb7d8ebfecd3a9df942794404b656fc1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1767+63cfe88f0.tar.xz"
  version "0.17.0-dev.1767+63cfe88f0"
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
