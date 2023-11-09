class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5a27c60af98c5db3d7d9d8567067ec15d1820a8abaaa4885de02ff7c383e1c5d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c377ee716903e90f6af36db08868efa818be31e82dbadacf58b7002b20d7a458" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cdefb8e6d3d283e240674b4d792a41d462b7de579f2719aa3bab31948a3356a7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1516+a70d8d29d.tar.xz"
  version "0.12.0-dev.1516+a70d8d29d"
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
