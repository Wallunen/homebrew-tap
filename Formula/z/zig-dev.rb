class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a5101788ce8c7e584b35c820a38ea21c980e08b60bac728aa2707fe9bc506a3e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3d5113239cd4dc626ef9841e3559c3a04fadf4f47ad972c9b9e0a7385335f3c2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e640c0cdadb4496c0b08377aaddf93f890bd8987268e525b89326118ebcbfe5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1081+5d080e25d.tar.xz"
  version "0.14.0-dev.1081+5d080e25d"
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
