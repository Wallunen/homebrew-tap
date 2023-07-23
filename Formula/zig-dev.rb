class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0b9d2d70ba49ce21c733e02c219038618cdf07e6ad4ed7230a626a7752087b77" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4738c2643cd71cde0d66ebfd3828067dec07dc97b217fcbda2f912d49977c282" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b632775b349122ddc1fa4deb93ca98b2d72cfb1c2235dd905f82e9bc8c6c1091" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4183+32a175740.tar.xz"
  version "0.11.0-dev.4183+32a175740"
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
