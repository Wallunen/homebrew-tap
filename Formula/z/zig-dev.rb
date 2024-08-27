class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c02e5e5bafef4278217390bba53bdbc26ce1700c3f1e9d03930eead2c43a8214" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1491c32f702594f1a004474e1fccc9bf07d38daddbd412b8c27f6ebaf51e75d2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1dcbabdbd4c41a324f2adaeac8365efe930c4a17241729a355e315f403017df6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1320+492cc2ef8.tar.xz"
  version "0.14.0-dev.1320+492cc2ef8"
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
