class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cad17d6b0d07302747761924cf5b70248e9d5938d7668ef634644a354ae9a70d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4d5154719e86b634289eee1c165d1faacd90b5ecf763d97cb82e9ae9f9a7e03d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e5d75502fa4ce7a1fb93619b25bc53294054375138ecd73d5dda242ae2ae104d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3737+9eb008717.tar.xz"
  version "0.11.0-dev.3737+9eb008717"
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
