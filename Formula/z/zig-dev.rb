class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d77710bee0fa904e2c5438c26058163cabeda271155f3a0b98454f3aa18e53bd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d5d52bc1f84fc713bcd41db79e4c8c9f9d9c3b939805db7b991d95968577f17f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d776e99542694ddc21de958d2d0c347ab5b167ee50922cfef930de3b40e33322" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2321+6cf01a679.tar.xz"
  version "0.14.0-dev.2321+6cf01a679"
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
