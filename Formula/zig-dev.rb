class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3ee8746302400cb0ac882645b4920ef8e4085cffd4b419acf3502f5df6d6ed6a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6348bd57bd4d23eeab20ff3c013dd53af0011954864d8b9e15bc3ec55f0b9ab0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "623fc865ee360b754274ce7aacfeed1ec533a9d7e4d74c758174c8dd97117fb4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3050+05ceac52c.tar.xz"
  version "0.11.0-dev.3050+05ceac52c"
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
