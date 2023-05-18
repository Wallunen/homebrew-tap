class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "82df9c9b37cd535518b0f9cea69ee2a04d269ab2888f9ac14260163573d0471e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c13cbdd3506b53e7bf769259477b67c6fcaa11c42b44620b3a5f320b59e80d57" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7fee375ee6f63ccd54c4cd14a08ca8f68ca9127912a5b2989c1a01ead8c9cc50" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3191+fd213accb.tar.xz"
  version "0.11.0-dev.3191+fd213accb"
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
