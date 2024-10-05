class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "222809c6f84827d4cb79b6bbf14a8ee7fa16146136577d7e32301674f3234b73" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bc10d57f9898e4c37607ab774ccc744c2a69d75f135a7a05e52143812eb116f4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "edfe58d19619e73f3590fa4962cd1016f80d9050a3846a2f1b8d2c2dc7a49e6a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1722+69ce7f0e0.tar.xz"
  version "0.14.0-dev.1722+69ce7f0e0"
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
