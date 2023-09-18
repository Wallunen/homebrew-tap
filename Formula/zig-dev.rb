class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "86d5ca381de4baf9ce40d6ac2d0678872b4def2cd53df1713154d35074f5c681" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "beaaef4239de3206e6b1f31ab15d01441082a63218f3d46043b08a8170b917e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c25e1d45d28a6e3d7881312783f0cfe324fa2c46053a506d450ac3af370d8267" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.409+48e2ba3b3.tar.xz"
  version "0.12.0-dev.409+48e2ba3b3"
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
