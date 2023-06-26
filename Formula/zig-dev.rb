class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dfd7385029591190d9612efb3f01c2210c27d0a224ae5f55f2e02f701a13ebe3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "92ecf44ceb5bd7298aef9c0d0cd7efa49d9e43b3229e13bcb900302320655d14" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7c19a335e16d246c2c40f74d6f12f95b156d94f3929bb1a61fbbcea818f87fe2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3833+0a868dacd.tar.xz"
  version "0.11.0-dev.3833+0a868dacd"
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
