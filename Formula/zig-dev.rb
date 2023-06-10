class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "70837d0951ab12775e7b1405c849bc2243f6e644fdfcbeae57cc977ac1104135" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9bc0dbff297960550f026f3d7d663956627deeb80c2ac6de9b9444c87b0a7e17" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5f73b824fe1d216e6097df5d750e039015f21c6f8ba4a825e19967e48d48554d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3387+f04e65bc0.tar.xz"
  version "0.11.0-dev.3387+f04e65bc0"
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
