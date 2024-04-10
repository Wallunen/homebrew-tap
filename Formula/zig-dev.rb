class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "986980de94bd039548e711a40bfc7b336c91c53a9473109e9ef642b6b9d903cd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c8a0af6419fa7063d057e43e89f10658634fc18f5eddb05cac7dbeb67c782e5a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e4c2a942721b8441e8f47feb4b5c920418a6b36cec82ff69fcb3e6f64947475d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3630+215de3ee6.tar.xz"
  version "0.12.0-dev.3630+215de3ee6"
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
