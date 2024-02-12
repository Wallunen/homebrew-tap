class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "506959f8150b4328d9c3836eb0a78cf603e929ff503b1e1b820621a3b268a44b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "34ac8344310f41f64b36eebe542337d1b4b30020e95fc2d36af4477ce488f14a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cd5f90bd10fd3cbd947478d375c2d5e9e7c6795881437f1e4f83a8ff7458d8f1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2704+e56fe06d3.tar.xz"
  version "0.12.0-dev.2704+e56fe06d3"
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
