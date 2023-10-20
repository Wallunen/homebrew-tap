class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f2342ae67d5fd80c90469e5a93e7ae73ddf48a61bde432422355048c3fcbc88" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5eb684c865c1917f8d06bc43ad96643477ae987d475f94f3e4f0995c13aca164" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b6bbe2580efef803e51e66aa7fff3d6d77eb64cc3d5f7711c9b73bc68b8051b4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1124+ec21da0d5.tar.xz"
  version "0.12.0-dev.1124+ec21da0d5"
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
