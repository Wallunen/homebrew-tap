class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a322e4d26871b831ef140f1088b7d6cda956b288af7d34017ecab556c5d477f6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f1bf5a9bbdedc29ec1c9cc4b3c0e4d8dbcba03cc6ca8c48e6004a27754d22cb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b96db87d77ab16f2920c17e378e57c5aea55a4b4c54c6cf423537da2f229e902" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1814+5c0d58b71.tar.xz"
  version "0.12.0-dev.1814+5c0d58b71"
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
