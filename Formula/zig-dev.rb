class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4cbab1f9ea29ffaeb64b626c28d03419571796e3d94230bd3bcdad8c6070db57" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "816439c086656bd9ee681c0c71d41325f7aaa46315e83f70aa3a1519242798c5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "56260dc5094bcc2ee66123f3e270e8214b364754566756a06de5519941cd46df" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.405+c1e94b28a.tar.xz"
  version "0.12.0-dev.405+c1e94b28a"
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
