class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "528fef3d286262e243066852c64ffd0de8609917c7382cbbfaed67d628514564" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "10bcf33bb72539b1505e5286185ed249b5f8ea755bac560377f652a560709671" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe9337b327767b5a64f2712775559074e209129a01ecad80c881947c38087a4d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.274+c0da92f71.tar.xz"
  version "0.13.0-dev.274+c0da92f71"
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
