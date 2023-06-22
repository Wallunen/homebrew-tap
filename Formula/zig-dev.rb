class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "800aed0c72613b7a4bbe222facb336fc22c3271fddff8507678438cd572ba51e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b1980301c8b42b1c877d376107906387feb0468dde5d919cb6d98928b39fcbe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "41669271763b99c5203badccc30a2a922a7be3f61753f22f92875a6cba62a33f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3771+128fd7dd0.tar.xz"
  version "0.11.0-dev.3771+128fd7dd0"
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
