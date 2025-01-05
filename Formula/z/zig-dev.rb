class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1d6553d97d9685c74972de0867c8edaf921627186c6e758bbc62dffe9245d9e3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f5ea56a5e5e86b984f512b579be91505e1057a51f6774dac6e008c4f6b79c092" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "232c5a057ee1abd8ad51e5e29ed5a2e408be3d8241deecb07715fe0b8586b7b1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2598+b4da8eef2.tar.xz"
  version "0.14.0-dev.2598+b4da8eef2"
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
