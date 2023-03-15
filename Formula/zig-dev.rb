class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e88666d702c1b003e1164d68e0325e31d78eaddb1d102036155bea206a941c27" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c5366ae18d1f303710f2c5bf566904be39d10ef530a6fa38772e1ce4d52c08b0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c1a95e6ffb3ab220c162419a087f519f0eb3319b56762b19c11b496ec8952c6f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1973+9ecdcb8e3.tar.xz"
  version "0.11.0-dev.1973+9ecdcb8e3"
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
