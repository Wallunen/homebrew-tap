class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "555796e2c6805c0e6e68305d959d85554da4a4d8480b8f940745e9675133e007" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "60ec0d82b4a3efa357054d8054eb5d482c2ff3d1dfb18db288cbb2379901e55e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1aa16dfb1a9cc8968d52fd775f9cad60a0757ffc0312569db4247ad06fac007a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3379+629f0d23b.tar.xz"
  version "0.11.0-dev.3379+629f0d23b"
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
