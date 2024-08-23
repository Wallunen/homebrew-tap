class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "da2bdf0ca10689fc0bcef1975c7829dd7ac3f3c43ddb450e724839222ed9d060" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fd5b7d97e10c8a23a71d9ecb74638aec3f8e57d588112f33c03601fb6d6148d0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5296808817b9b66378ec7ccd1f0fac8a0dab7468ff9d91000e3562bb498c24d3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1257+febfcbd49.tar.xz"
  version "0.14.0-dev.1257+febfcbd49"
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
