class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0f00c32c4620f06bbd7488f2a28d595779c17973d3c7cb8a5898454a5340bfdd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c8b264acab32e1608a902a51eb8515b29abbdffed4148c2f55610f38a08002d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a7f7a85ccd444bf068be3a337380f18f94c99bb139fdba6206a6913b52c4cd7e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3334+cd1417dbd.tar.xz"
  version "0.11.0-dev.3334+cd1417dbd"
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
