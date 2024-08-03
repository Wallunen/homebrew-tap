class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f204f2cf395ab0f281e08b1157ba96fade7d61d9c3f19930f14d6672fefb5cbf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "def53a70b952906c0bdc2bad38088b0088c0bf5555bcdb17cdd23e5e7c42e5f7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c1b04766e237ce95ec7c3af2ef3b7e3f12298b2bb2bcef6eddffc5f3004fd543" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.829+2e26cf83c.tar.xz"
  version "0.14.0-dev.829+2e26cf83c"
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
