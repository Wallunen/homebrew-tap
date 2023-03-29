class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d1d3410b0297d8be7441e5a70543db63cef3555d4b6293af9c459df561564d96" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "154106e6248346e25e7d579ff575864f22051113e91f06d6d4f43d9f98ce1714" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0da02091ccd4d7aa81b53458f6a7979e0784471bf1e98580557b7624fbf2cd8b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2298+5d63d1115.tar.xz"
  version "0.11.0-dev.2298+5d63d1115"
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
