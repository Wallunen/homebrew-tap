class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5fc4f8ef1b666db048440426fc4ef4d1c25fb401f399a8e9c1006f1ece413715" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c0198b6de2d57c20aebace245d405aa5b9636e28304a59a6be67aebe5e7d5586" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "41263c94d1d72e4f52abcbfb3da4b4309cd39aa05cd5101e67cc308980183e80" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1872+2b5897836.tar.xz"
  version "0.12.0-dev.1872+2b5897836"
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
