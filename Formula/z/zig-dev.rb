class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4b17bca3c459bfa2c69870e228869a395ab3ff287f9eb52c0d7407adee2ffca9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8d88996b5e66336018362d720843bd6e1939046ec324a1c3487de6e932ad7419" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5abba62b8ff2dd7fe71a08209f3318cf3b5b884a2c0b0eb437f90f5507992481" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.318+e5c974fa5.tar.xz"
  version "0.14.0-dev.318+e5c974fa5"
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
