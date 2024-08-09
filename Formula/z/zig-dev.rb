class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b8894c3b9c92372c79d05268345767916bf5c24c49be32006fd79c421ec3cc3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "741a4497a0ffe46ae9dbb3efca18b6c7e3d67931231756a12082b3533f351ad3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6716059f59b9a800a11aa00e445e2aa0a5d78e0c8b7e63727ee5dad8efd72fc4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.984+ca012e5b6.tar.xz"
  version "0.14.0-dev.984+ca012e5b6"
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
