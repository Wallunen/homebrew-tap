class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9c3408291272d49a29e3008eb0a1db8186d36a4a6ff223dbe501e6d8e5067b3c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "897c7b6d36fb7733f2a0ce1a003ca53fc5deaf0fcd770daf84f70277f95e80b8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e7b19bb83f034752d19c8e48a8e5390eafb18fd976e453b7b6e89fb7aa5809da" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.719+f21928657.tar.xz"
  version "0.14.0-dev.719+f21928657"
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
