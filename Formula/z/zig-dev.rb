class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "81d84d51d78d065a75dec519ad2e33b4e9a2a319808a01d0fe6a0e41a62e75e5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "897adf915009ef66564d05416dc2a7543e434686e7e4edbd7d6429a9fd2ae1df" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0406b11cbcb82b5f5d9bf25a623e9547b59685cc94afcd28e156126ada0485dc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1084+72bcc3b7a.tar.xz"
  version "0.14.0-dev.1084+72bcc3b7a"
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
