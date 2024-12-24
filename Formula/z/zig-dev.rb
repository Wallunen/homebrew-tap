class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bd67adf4357cd06ad27a7d074a70762b4e2cc9cfbb5e67cc73926928d2a2dd1e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1d7452b270681fbabe94d4155ed14c990e9f0865b60c69b3a1370dfe5801c489" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5ca1dc1fc13181c280c283fd0b8b26190b012df96714133c62d39c907f9e3868" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2557+f06ca14cb.tar.xz"
  version "0.14.0-dev.2557+f06ca14cb"
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
