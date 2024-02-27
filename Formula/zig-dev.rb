class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ff5f621049a30b3d36e01f310b177ceacc4722e724084a76e57d3100ec49489f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f6b569a895c7476c83cb5a50e361f0f42e1f3ad7bd2881da1fee03bd32724955" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "38778f09804d132d471e32c62f0d7345e2a1e529db11bab333330e77269b9942" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3029+723d13f83.tar.xz"
  version "0.12.0-dev.3029+723d13f83"
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
