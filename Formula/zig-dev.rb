class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d12a624694f5a403d65d607dfcc615105efca726c5adc1b4b1e6e6aef5ff2e17" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "81e45b1886cd7fa345bc9ba1604313608565187725efe391c8fb25cf4cb15b93" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "812b916dfb4e3430eb69921c8062a7f41f640dd1ee70889b1434d659fd3047f6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2969+855493bb8.tar.xz"
  version "0.11.0-dev.2969+855493bb8"
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
