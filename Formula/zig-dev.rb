class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b5fc11eee198ff0e569cd6c784185660e47991deca7aee75592f3e12fee5104c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "37de06afacb4a85318cb24cd0c1eeee4613fdc0fe54b3d5ce6879f19e2be2c39" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "454c16b2cab8a06b514a5b3310c18496d723c981a5be79c56c25258f3d7d4756" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.345+103b885fc.tar.xz"
  version "0.13.0-dev.345+103b885fc"
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
