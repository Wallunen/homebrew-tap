class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e0e634bd7ee4c2fc39d11dc51ae617d79012ab768723bfc4ae1bf3374a2a1f36" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4fe49f01c2185ca01158329ec87a7e884419d7616b006a1cb41ec740f79db0aa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "561c7f02b6c0d221fcc66e0e05d73291365e81b1d109cd14c5922b05841b305e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2213+560d6b99d.tar.xz"
  version "0.14.0-dev.2213+560d6b99d"
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
