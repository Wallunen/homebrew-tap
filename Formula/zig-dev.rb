class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e1b04f9067851afee11893ed2d9b2c2c735691431aa65bb7dd72a13cc0d9dde1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cf44c2e99162021df401e104025d7ccd6fd2a76ad92b783966a3d6b31fb68436" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3b53528317ff1433079ab4ff17c9810c40c199641d3ec2e4262bf425bd544aca" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1538+3f10b3ee1.tar.xz"
  version "0.12.0-dev.1538+3f10b3ee1"
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
