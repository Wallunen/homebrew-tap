class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1ae40a17c7f2a9cf0b0e291ddcec9b7b4b8263bbe2ae6259868ac6e12429732a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2f42401e3b092a8a503abb67f209e0a66314e5c24a67239800022386ebdb7e67" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9bbb2a2ac1886efd5d3979c631a1d2f14e6a58fef66c679083a084a3ebf414ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3284+153ba46a5.tar.xz"
  version "0.12.0-dev.3284+153ba46a5"
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
