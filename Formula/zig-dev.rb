class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "338f35957ee68e18037579b5ad892df8812806091703e89508df5306f87052fe" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1bd88f0f64eceaa8ea7f2b257c2f17009b5a4231fc9d535e74185137cf1f008e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b7bc8484e649d41c141491d0df9ede39908f74164157af8504c11d9f9a6cd832" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.4+e7ba4b7f9.tar.xz"
  version "0.12.0-dev.4+e7ba4b7f9"
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
