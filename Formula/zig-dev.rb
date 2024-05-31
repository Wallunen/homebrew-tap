class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ce20935307e534e85cd0cddb0193ab045efc80297cfec41fbafd9ab439f8089f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b8264c9b76912e3b9f53f60930d4aa275c6af89aa5fb4b043b00b1f43cafbe87" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "74b425f4935e670d34ef121944f7167c393ba7df007178ec2f22a2ebc370cd13" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.346+e54fcdb5b.tar.xz"
  version "0.13.0-dev.346+e54fcdb5b"
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
