class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "63a001da37a61079a50df1c026da8b27c7af83576bfc1c016f870c520d395b31" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dcfbf903906bfce5b70b5e3bafa6797ae751b497fd0e4f3027601e7df86c7976" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e0275f229fc39a0a8180dea54ab42fdfa0bd5e35418fc822ab3d41bdb037abbc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3298+5744ceedb.tar.xz"
  version "0.11.0-dev.3298+5744ceedb"
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
