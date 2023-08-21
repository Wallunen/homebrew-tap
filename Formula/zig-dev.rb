class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7ef35b5fed92e971ec2735e70e582ea59c84048604dfc2c071330390d27f3d57" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f798bbf73438b361c2cf24e49aacfe2a8326579992afd476f0fd81472898c400" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cdaf177874ce03aa556c68e934e696e66ba32e8dc7d9f1d3cf77ac828cd4da57" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.146+020105d0d.tar.xz"
  version "0.12.0-dev.146+020105d0d"
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
