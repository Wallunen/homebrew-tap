class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "68b8cc3ae355fc48d68ad85d27fdb381358bb81b5ef805754f9a4e7d0d4ef0eb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "76837cff871cd81f2ec876a75f2032750d6d44da679fc89349631476e1d32f26" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d651e724cfd56954734e652d72a007b5e6fcb0a4098e0ed6c83f984fbe141821" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2325+c964e1082.tar.xz"
  version "0.11.0-dev.2325+c964e1082"
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
