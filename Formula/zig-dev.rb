class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "33bb15bbb7e8fa370359e4cfb99cb82ea8243735e8d6ee47a761abf34e84e42b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "03a3ab0ff37312c7c58be648e2ff21442ad460b9621bda9029032636e9ad0ca4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bd0486f34ae43b175315bdb84ac524f12407399eeb942b78c21606bab403d6fc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2375+771d07268.tar.xz"
  version "0.11.0-dev.2375+771d07268"
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
