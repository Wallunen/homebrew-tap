class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e85e0b3c05767c6ff586f5d14124b821c4759c4fe96baa20e4c1ebafc09fa306" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18990b4cc42c20b8594934f9e62c7aaa3d0777ed4d36bf8b5a26b7d1aed84784" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dda21a747b026db5503a2fab76bd5cdd65200ebf97d3e0e20c0f6453e69cd7e3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.28+3c5e84073.tar.xz"
  version "0.13.0-dev.28+3c5e84073"
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
