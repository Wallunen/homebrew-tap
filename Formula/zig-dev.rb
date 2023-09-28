class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a77b56cf66d39a512d505ff9d7d7e45abd2dbd2f3849324766a148a00f421fe8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8b6dd2e74e7f45793bf07ec621c381e4cc7cf3bdec1bf708ea5d8377b3bb1149" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e3ac97d529898a0cba5988352301ae9a36450370912c79b3dbfea863af9838c0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.627+de4d1ea25.tar.xz"
  version "0.12.0-dev.627+de4d1ea25"
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
