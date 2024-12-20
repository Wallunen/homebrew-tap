class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "37ec762908a9e56f6eff15079cd9d68418a2055be3abb019d708274356cdb00f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6759d7ba6c44bf2fac34fee53cbd02efc324538542d52b2451b8d5fd30453774" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3074eb199ebb2691d3bb7d1d5114effc5be733a067b4c258a0b0fbc54f31529d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2546+0ff0bdb4a.tar.xz"
  version "0.14.0-dev.2546+0ff0bdb4a"
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
