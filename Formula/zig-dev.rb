class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "77d3189032d08f301efae0145e7027cd899125e4b3c902e3002f6804249d70d1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b1e7ae191ac0d3780de7825d1f016caa15ccdb4cc27ef3d910ca2dcc5aa2e886" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3f0567d3af401963e11be3799f3299b2ddb1f6bf957f5a039c08ee75839f8ab7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1863+a63134a4a.tar.xz"
  version "0.11.0-dev.1863+a63134a4a"
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
