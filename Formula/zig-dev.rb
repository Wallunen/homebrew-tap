class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eae1df0bae63fc62f8b5688d047897c206e9d02b47a34920c6c3f029877756a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ba144855947294440f02c754772cce7f1d2dda28810c862c8ddb16ddb7ba524f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6d3c37536bd4d4198efaee61985a525a21f560edb1a03b9a38bfd02d3b476fad" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1536+6b9f7e26c.tar.xz"
  version "0.12.0-dev.1536+6b9f7e26c"
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
