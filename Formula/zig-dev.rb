class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e3776cac1f385c472477e1c354c7ffc20d21311467b73be960b9599f8a92719f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0f3e99c66516ac8ca4ae262e88aedd0cd165ff8d6d0b9a549f63efedf7f0ac2e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "68a1be9a5ff84ca93557ce1f0ec62987729fde719f18619270619ac2f57b0469" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2757+bec851172.tar.xz"
  version "0.12.0-dev.2757+bec851172"
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
