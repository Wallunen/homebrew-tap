class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5e900dbd60a7254588df152fa3e9c2467cff94b2ea32f37496ec88cd4ca271bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f4ded20b7677f9d0518ecacd0a1d6938839b03c3a9ca93096dca24026fe8b745" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c20ccdec18fbd162a1b9d66468ae59e53f1fce91fc25a293734ba343554d62da" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.89+913511557.tar.xz"
  version "0.12.0-dev.89+913511557"
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
