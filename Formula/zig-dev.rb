class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6b7cadf424319c3f5bac18df5e8f986a0f9c934d08aef5db97879407b26d1056" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7bd959c1be7350ed8bd2633d0a3312e7c1cae7eb140594831120784b4f1ef899" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "71f35697a0cdc2dbf1690cfd847067568e9e73eba91e3ea0f8bdebd2f5cbceb1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2685+fac120bc3.tar.xz"
  version "0.11.0-dev.2685+fac120bc3"
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
