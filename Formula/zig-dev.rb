class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ef6884b1b3b2b643bac8423f3370181c2c3ba1e884f87b4e6f7e60162ed99c98" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cc3a722d6cc23974b7e97f6f08ddb3e48ba8a122ac664f321adc1a2356cd0f17" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "096ee7c645a8de11981b12e174b099b626d89bc6d3530e961b941c80cf3792d8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2271+14efbbfd8.tar.xz"
  version "0.12.0-dev.2271+14efbbfd8"
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
