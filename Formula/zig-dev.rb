class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d8d7b9d511e08fda3ed345f2e9496360c71df07149d22cac60667751b234be75" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a8e3f3a5934aa309fca37173596fdc545f4933314cecc8ccd2919526aa8b3f6a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9151faae09d1bd8ccaf05a27909512f2ac3d2f7e80d4a31592da5901b72a6d71" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1837+cbf2b1fea.tar.xz"
  version "0.12.0-dev.1837+cbf2b1fea"
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
