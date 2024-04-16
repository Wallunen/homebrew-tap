class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c4a3d3b5be0c330678cfed620860877548439836c88589cf0b12af42dab6af17" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5f1fa838d7e003920c26c94c53d5f374fd8869063304d40b3fb9932dce166a25" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6da2b0744fa1a425218bfbaff3d713c3f220808e4dee484a0f816361d80c4f13" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3657+d23a8e83d.tar.xz"
  version "0.12.0-dev.3657+d23a8e83d"
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
