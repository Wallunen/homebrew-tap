class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ea2b79793c87f2412f07f9176d59c12981d9a34e3a4836f03acabac28ab9051b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a494adc423be2767baa76cf6bc0863af06a26a83b5b62fa4530633c2b3f0fd2c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "92b0d08ca2da94703dfc61047bdba74cd45bb61794796db14d0fcbbb4cf5a274" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2054+05b445a27.tar.xz"
  version "0.14.0-dev.2054+05b445a27"
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
