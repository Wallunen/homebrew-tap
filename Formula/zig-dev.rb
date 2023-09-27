class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a3f0913ee0ccd638aaaaf794ee37b3c608740d47fb384e932058650114fb14e4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7cf06a925abee77e4edb13952eff7d378b70098373c7bb5c97ffcf57ff5e7307" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e8c786e572f482b3879127db54ff3890ccf7b8b569aed6968b106d3bd82b9e18" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.601+f4c884617.tar.xz"
  version "0.12.0-dev.601+f4c884617"
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
