class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "10cda853db110164150d6e0bf54f04792540b6a901e668bd97ce23d3688bf6b8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6c14c7a47567e5f1bba33db57733b999297f8b1c22952526f3ba438422a8ca44" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "058315af429c2408301e10a4fba57c30cbe5795eb4a1469ab86a6ca35b14f6f4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4406+d370005d3.tar.xz"
  version "0.11.0-dev.4406+d370005d3"
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
