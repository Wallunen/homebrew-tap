class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "59ac68e2555fe4d1663d5539a0e48ea115ba6063051707565790c842b57e7ab0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "997e517069d7a928195f7a35bc9f61a587525ce9a5e872c01ebb5ee846d42030" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b97c86d3a56380df115656bd678db7582986164f39365338dd97a5b5b45e3d9d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3731+c6e2e1ae4.tar.xz"
  version "0.11.0-dev.3731+c6e2e1ae4"
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
