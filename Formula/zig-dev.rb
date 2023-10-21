class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5cda158e5ea9ebafced85ea4462ece93200fd7db8aa8267c974c8badab33332e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c19689fe2c6472f2053fac9dce8a0be0f2aca0b01445d0524d79e7dffdc28a4d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4fd7c5b4453ab928d4bac25f279745f395dfca9f30911fd6cece5e7b005c3264" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1128+1bbe52107.tar.xz"
  version "0.12.0-dev.1128+1bbe52107"
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
