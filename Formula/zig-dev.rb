class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "189f4949012914d2573ece4f6a8a0679e6b7123ecfe1e09cc106615a323188b6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d53b13ee498adb6f704ad3bd6e24626f926e7b4eef7d5fa93d9c84a2504f9b3b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "02720dbde849fc8c1c516c64439771089f18812a19b97c1b0a7778694e352d79" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1595+70d8baaec.tar.xz"
  version "0.12.0-dev.1595+70d8baaec"
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
