class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e4fb49c0411729e86eb03b788436c5d8db9efd7bae36198bb703d3f9e9a7b68d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2d4a0d0a747516dbe513a2ad36600c43a47e758e6d721145afbd2d64945ef8ce" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b0aa3e77f67a23c3263b13243bf26cc432a0fd129bdc5bbe50e9cf64774f5a89" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1417+242d268a0.tar.xz"
  version "0.14.0-dev.1417+242d268a0"
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
