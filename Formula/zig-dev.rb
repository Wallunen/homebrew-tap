class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6d2c8695f6b3844b731800c4ffaa33e059b1f3d565b4c28c73c5282d792e41e2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f0a9710eb537b77e1ee6702d1914c2e25403ab0715f5cb7e96486471133e8300" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3aa5e308cd3f771731673f03218c781e3b28c3cc4b4adf347df0c5bc6bf735ec" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3489+c808e546a.tar.xz"
  version "0.12.0-dev.3489+c808e546a"
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
