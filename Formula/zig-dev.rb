class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cbeac1cf2bbbb69247a105c7d5cbe820e042e68e243f12857a30a832cd13603f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bd00a768d084c20e6f1f8ebf804f58424110ef9766cfa91e8ab09ef1d88131b3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9ea7c37a4819be79c5bb0784ab0ba2ef290c98a9e742af8186892b95b69b40c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2460+55a8b7e1f.tar.xz"
  version "0.11.0-dev.2460+55a8b7e1f"
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
