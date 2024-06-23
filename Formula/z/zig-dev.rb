class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b05063bdbc475432999632100e7ebcc12f31dabc8b0ec44a74ade2c0c58829d5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1fe7160e2b7788ecdcc354fb162aa507fde76895ecffef7267fcdd84121e9f09" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fb611f90841afdea9ddb6a129c89071c2278ad20c7fb1b170bd071754959f4a9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.114+0fcd59ead.tar.xz"
  version "0.14.0-dev.114+0fcd59ead"
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
