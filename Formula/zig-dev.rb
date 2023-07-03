class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b874be18087d0c9dd4c70ead84f0094898241df7363fe96aa15b1b84fc1de31b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5b25093f6b13d69be397054752f25c6672c026f2d10a4c4944f17c58c5b7b09d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1c7f0b737a8c87f6cfe84629e1440a81cb3054f61e7dd8cff83063826474674e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3910+689f3163a.tar.xz"
  version "0.11.0-dev.3910+689f3163a"
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
