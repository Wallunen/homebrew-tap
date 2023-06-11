class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "90fdacadba76faed40a034f85175b57441e29fb6fe6e8c85109e2bd47229ec42" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "92813c1b52d330b94aeb185715423f9afb1e3cbe8db272d13e07920d3b105dd9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a73f3a60cb1a4ac268b54c706d9ab0f4adf75fd640d5e29b9adfa6e7e1d59278" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3393+34d44e0c1.tar.xz"
  version "0.11.0-dev.3393+34d44e0c1"
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
