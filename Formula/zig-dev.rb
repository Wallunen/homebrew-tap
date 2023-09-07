class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a4280107d69475bdf67b8d213e4300973cc7ee826847c147ed12881269749587" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "09df99484dfcb7ff9222953a7709ec5c3cdf676b34a720796329e609fe0b3585" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "039c8c5565951d88a1df9e3b3c3daea94907542846a197e370cbc7b61031a218" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.283+8976ad7ec.tar.xz"
  version "0.12.0-dev.283+8976ad7ec"
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
