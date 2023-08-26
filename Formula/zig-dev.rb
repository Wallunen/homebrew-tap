class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a19e9fc001fe137ed1077303a2937dc118cc2a0a5dde47e8f9d3f10518b79252" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2c6fe9890c2059d9f04906d913100e4a6c3aa4cefc0d33b7a952b746d5d1579b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b788a653fd76bf4480c6b9a57076ae3542812b97871ca74751e722a71418f8be" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.168+a31748b29.tar.xz"
  version "0.12.0-dev.168+a31748b29"
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
