class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a2653803fca5624f55112660aa691e252590e2be592de0cbfe5a29470791a1b3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "147688563b53f1b02863e61fa7c831a48bd290717487f3f90c40ba5a629a2fce" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fb551c5daaee5c8fcfb6eb50a57c679bd2473415911e96d984e3c6f56018ba04" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3777+64f0059cd.tar.xz"
  version "0.11.0-dev.3777+64f0059cd"
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
