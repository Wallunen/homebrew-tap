class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4c0905d549cefbbfa4fe591e473af59f3cd263b4c74d1a79db88e99b4b0dbb5b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "aa270a026c7ddace20e56149882e825f539b4f563f6716f79ac8cb7cd3483a6f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4d68b050ad3788559f2a7ab2f2af54b4630a1007c4d77f71c76efa8dd62a840c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1897+6218e4004.tar.xz"
  version "0.11.0-dev.1897+6218e4004"
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
