class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5946a905655e024ce35a73783a9fb03d29c699b7f10faa15f95f8b843e0011c8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b783ac7730e35c96aa8c2e36cdad5a8d69aabab608f4f135f2128a10b0fa6282" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6cb1b854d0febb4d601056793cf712f08fdedeb0534ba41deb9c2075d5f7d3e6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.353+4a44b7993.tar.xz"
  version "0.12.0-dev.353+4a44b7993"
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
