class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "01c8e01e4f41ce7fbf55528df526cbc301553a50e721a4a032237f2907aba0c0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ef060deab7a620c003f88c5356630233a88ae06850d3604698e09e52d0bba4ca" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bffe9e0cbb1ac1161f29ed1fc2a9d04ff79e3c5674c2c1a56e6007932a7ec09a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1642+5f8641401.tar.xz"
  version "0.12.0-dev.1642+5f8641401"
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
