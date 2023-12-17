class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4a8aaf06449e4bd7bbc9de69487733d32918fe47fc5d0222b730d0f9ead7849b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "be8514cd49e33e56fa4c2f4b68b302693bdec630ff3705be10d6a614e4d8ec85" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fc28c64fbca04c359a716ac3491d279c3ae56c459e8db08c78aead2638e12528" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1830+779b8e259.tar.xz"
  version "0.12.0-dev.1830+779b8e259"
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
