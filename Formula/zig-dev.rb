class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3111d145db5acef7c94b5f8d93a15a2602f67d89fce15abfa8302c0ee6107f13" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cfa93d1adce99f4db930c657ad42f1c9a7362ffb643bcd38f077c806a4ce1c80" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9011b55209b7c9ccbd81318432866c82d962c3f42113b335555dafbcca2d3805" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3397+43edd53c3.tar.xz"
  version "0.12.0-dev.3397+43edd53c3"
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
