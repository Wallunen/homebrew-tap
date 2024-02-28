class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "988c31ba022c042087175537fcd3aca6dbd7fee72cf8a6db6fea31c7e0306f10" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a2edc976551423a37e8baf23de27059c46a41b79ba5f77775e4faaee02b0b872" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "03536a919d4875e00efab34a4ffc5c18809b9e24dd50eeb973738c307bb12c7c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3059+27f589dea.tar.xz"
  version "0.12.0-dev.3059+27f589dea"
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
