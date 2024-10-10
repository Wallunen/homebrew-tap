class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c71e95b19766ff6d6479a1cc162a6da25cf224ee71cad0270b6f8be428a0ae5f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "84cbae66017f6ab682b9ea8fb12de241803a6057510c07250c78fe5e64e20740" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c8d2056b97837336b82f45f7c4d8beecdf842e8fe4477e6f3c98b3ee32150027" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1860+2e2927735.tar.xz"
  version "0.14.0-dev.1860+2e2927735"
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
