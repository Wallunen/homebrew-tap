class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "58ae94c5dbb802514c209eca4af29749365a99033670a97669b40653c225ec3b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "698c0beccf09821c50dc01d30a0a506b05a43a8d4c40065ab8912f775e4a79a2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62d4a18474c6062859d6680fa1b2aae6f196c10ef6192b1f5cc42b3541f8d821" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2839+d0311e28b.tar.xz"
  version "0.11.0-dev.2839+d0311e28b"
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
