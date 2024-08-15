class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b6386e363d4589e76d8d4108628f6810c8d19abef6f0549f5edc8735066472a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a576f650a6698de84e580c672aa4a0b80e84c63b3a1f49322dc136c59891e6d7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62a84b80f61efbd350dc1a36866c43396eba438830421bbbf09b565d5f780afd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1057+76f062690.tar.xz"
  version "0.14.0-dev.1057+76f062690"
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
