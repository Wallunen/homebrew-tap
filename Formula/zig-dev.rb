class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cff9e0ab1bf883475df561d355f91877d6ec5cde57875619798154d6a6cebe04" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7aca58724421587c4a443dd452177d9453427eb2d74341b5401feb7cd67bedc7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b6155ff9ce25005ad6793a02167dfc1e499090dac5c91011c31d097f8214269c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2759+c280811d1.tar.xz"
  version "0.12.0-dev.2759+c280811d1"
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
