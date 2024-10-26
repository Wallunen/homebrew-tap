class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7474e4de4567b614e568f965b581792cc7551a038e3f0bd2732cd6c8ba1dbe51" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc60e48285620724a13724d58eb59c494c22c3b3dfb63a665bdf340bc23d4426" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3bf74153f7c90d0daded31083ef53e7514c41ca1f9e8e19029688d872bb9661c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2047+985b13934.tar.xz"
  version "0.14.0-dev.2047+985b13934"
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
