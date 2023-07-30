class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "36bc636f5348ced88ff783fc187c462853fc1bd75dc53aaab1567ba2280ca5b6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c2c5edb637fcc0bad5b32cacb4abb71943c1f825db87c01f50ab224332b3ed4b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2a03d2d4c83b8dc389bbc901518cc2cf7de05beb0890e0d3f4f574c1396b859c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4315+f5239677e.tar.xz"
  version "0.11.0-dev.4315+f5239677e"
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
