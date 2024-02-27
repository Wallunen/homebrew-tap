class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ecfac423e368a299a672cc2adf19ec7d3e347c169908dde7376c409c6fe0601e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "076f151a9456cfdc270013a154e71911f5962ec4405bbaa0e69af29dbf0a6187" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bbb0616b6bea48c625f7c66a8d6108f5b5d31b0055d712e04d72a64fc9093b24" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3008+b2374c4d7.tar.xz"
  version "0.12.0-dev.3008+b2374c4d7"
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
