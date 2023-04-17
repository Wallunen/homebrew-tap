class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "57a630d49a9d9429dd96f2f184c5225300950c38a4c7daddc9486285a53eac73" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7d61211e84886177a1ad821b0498ee3379c15c9da48ebf83dbba78bcdfa1fff1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7c0e53f8d52e37c2c93f366e4d55cf44e9f0538df30bcc5b9a42d8dbd0cc3753" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2624+bc804eb84.tar.xz"
  version "0.11.0-dev.2624+bc804eb84"
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
