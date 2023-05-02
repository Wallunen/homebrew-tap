class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d10c667388025c7944ade6c53beaa5cfdeaefe3cf3ff37d4d1ec89bd434ca453" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6d587b6a811da336107c8f540fa973e2a7f6a1388810e4a61b2f18ae8d093f24" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6b604a09b5e3cfaf1643268488746e703c00418f5c2f3021cf50a5b6efbc02f8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2935+ec6ffaa1e.tar.xz"
  version "0.11.0-dev.2935+ec6ffaa1e"
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
