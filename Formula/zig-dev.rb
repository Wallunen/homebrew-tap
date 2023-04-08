class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d2564637a71eff51fe78ef7b27941b9b609325c2119bfe2e590322e6d808a927" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "be4d8a89ec26807096ecc78f409d6d8099467c89d79ed87598daaf5e6e541615" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d71202e6f0023b3d612a2b297f965b091542af870f868683fe81eb717511c531" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2450+13aa7871b.tar.xz"
  version "0.11.0-dev.2450+13aa7871b"
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
