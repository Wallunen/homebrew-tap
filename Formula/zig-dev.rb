class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b616f5e714d0f00bf4d4b64834a8ef343fbbaa7c9e87343258c1c2d42f11936d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6e158c7d9ffd81c93c4dc261bff18e51e134fb242f0e94373ffbc905c75f6f15" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4e0c4ed08fbcbf8e8cc6665347b27504387d19e29fff7c31c84cddecfd750b54" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.5+fc6e57568.tar.xz"
  version "0.12.0-dev.5+fc6e57568"
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
