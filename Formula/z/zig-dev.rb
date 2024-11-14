class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "da8989779d41624d07aeaffec4b4e73bed1eac0f0cdc7b3935f17b6f8140a377" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e07cb93caf3928fb030d293c270486304f7618102f1ede28d7af27841d221f06" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8ba1e7e14a9a713ba011e528751e8301f83be56ad8f99445cca4ee26a19a8d2b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2243+9ebce51e1.tar.xz"
  version "0.14.0-dev.2243+9ebce51e1"
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
