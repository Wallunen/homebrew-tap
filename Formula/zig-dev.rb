class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "94a1ffc79028305299922720a05146ecff3dcbc13a13e8af11026b82ed9cbfd7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "81985cc2f7f5ed508661c9fde13ac7c7e6ae970c2e5e87b731d23dfa3905e517" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ddfaffb2f352ecf1c150e8c705ed10874dcb93c2e16cd25fa44772b50227106b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3318+6724a524d.tar.xz"
  version "0.12.0-dev.3318+6724a524d"
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
