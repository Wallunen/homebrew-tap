class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4e76a8bf018a20b891eea6f71ce8bd1babe9548d35a3699c77c88ce4804c855" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "217f862ed1363f8adf096e9712d9661e5bbc379cefb54084d515baa5b012b926" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9d6b3dad9ff788f62bb13240d0d918c90a785f564131983a643775bfefbdd216" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.211+6a65561e3.tar.xz"
  version "0.13.0-dev.211+6a65561e3"
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
