class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "19e0b3673fd16609f7ce504faadb1c988270c2ed7cb250a7a9cb74beb22a4c23" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "034d395256d9f8b9f4e9fb07bc3428336b5138853dc2d518898fa0fa8fab434f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7be6abdebfa970c6138d165b348d0464e84f16f531e71cb20c0e052fae1d8c8d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2577+271452d22.tar.xz"
  version "0.14.0-dev.2577+271452d22"
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
