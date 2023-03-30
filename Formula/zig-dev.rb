class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c5a99d9a00f28486cf8f978f00b0cfcc74afe165e754bf996c3ab582b8d3bd31" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7883be47afc50fb8d201df1edc57a4cfea9c479e5c0bdacd2182e82083c0e002" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a9a996c677ff9455ed01e70229d6d5bbfbc07025725c5460c0a88fd49556ef99" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2317+46b2f1f70.tar.xz"
  version "0.11.0-dev.2317+46b2f1f70"
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
