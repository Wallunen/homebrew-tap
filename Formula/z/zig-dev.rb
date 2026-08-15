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
