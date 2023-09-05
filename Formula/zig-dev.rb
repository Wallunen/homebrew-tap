class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9e8b42b4bbe1898fd0d7a7328970d528c5a94afe0908ff0d1b170f4ee974b5e1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "caa19a9b708d98698ca5c239d067095d03dee71284997a52217ebe212e7a7196" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bf9451256e9bf30e8ff008439b8f38c4b9d405c723a23efc60133052c4847a2b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.280+64d03faae.tar.xz"
  version "0.12.0-dev.280+64d03faae"
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
