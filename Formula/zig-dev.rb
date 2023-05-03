class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "195aa4350b5adfaec5445897a742b027e17ba90531abb46ff6497468ce81fb84" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d1623280cf792a17ff5fa423d8b98f0051f28a4cfc43f3a4fafb10218328ff26" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4c56944c1b6c5685b0a743226fa1f39180112d676d6a094a0606df84f4b34480" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2964+e9cbdb2cf.tar.xz"
  version "0.11.0-dev.2964+e9cbdb2cf"
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
