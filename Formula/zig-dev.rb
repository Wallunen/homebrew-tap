class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b7ffc85d079e7c7575886a737605b14dcca1ee5caff4dd18e1f0ccf8992bfd1c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7501d9075b371a40bb2f5ff1a2bf96d417bc87bd72f63f7cb513fcf501868f33" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "985a1f624f416a3c055d1a9eedfb5de4b0fed956df9fe3e7a5ef17466c1af1fe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2756+c7067ef6e.tar.xz"
  version "0.11.0-dev.2756+c7067ef6e"
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
