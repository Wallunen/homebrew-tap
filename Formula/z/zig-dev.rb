class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e50535284c447036f411acef75130ed9b66d91a62b72b8b9311eb8849db06c2f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "aabe9c9238aa22aa260f2f4984c42d4d01d8829b668fe9ceecfb4186782a99be" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "39096a3b886982a50884b382c1f842c7659cf012f01189899c96ab3e7cc51bf4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.620+eab934814.tar.xz"
  version "0.14.0-dev.620+eab934814"
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
