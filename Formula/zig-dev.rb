class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bbe92fdf2f3a7bb2907681729c5dee8f6f729c95805a92f55d001416f41ba246" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "822827ff5508db0ef5ce092c198f814d7b2fdb5bf129e0ae7d53b93205b8e249" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "18c639e2f1aba7b570fd0367518b4e93e907f7fd2769e3a10ccf8b6ab695d838" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.287+6484e279e.tar.xz"
  version "0.12.0-dev.287+6484e279e"
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
