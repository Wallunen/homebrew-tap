class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f270b77b29827eba900ec1328751d3ac1da27b6dfd98f3d20b045c8da501b139" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "12c45e644e3ac89099bdff6a3c37cfb8d30de6d4412899bc095045dc6f4be781" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3bf8442661385e0020207ba7126bb2842e481cbe7c1c2a8a77c96803c36ab962" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2183+ee9f00d67.tar.xz"
  version "0.14.0-dev.2183+ee9f00d67"
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
