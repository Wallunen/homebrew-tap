class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8831b6017890d6e41af6f55b85d46ecdb620dc57ad81d83a0d7c66421ce741ea" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b3a34ea2d88cd860d1eb7822ee020e015be09f0afd6393bd1e9b5a3c1920592" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5c05f8b15780f4949a1d687356fb843d9361ba3496961be742bd3ad75a2c0337" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4008+a0b35249a.tar.xz"
  version "0.11.0-dev.4008+a0b35249a"
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
