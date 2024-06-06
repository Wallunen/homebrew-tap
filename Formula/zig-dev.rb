class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "324a71c761b2ed2efba03864eabc387b0e199ef1a168aa9d7d063fdb2575c03d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9676cf5982c9f6c8befccc091a0abf9f07cf5b3f5c8752bfbabf9c97cd557730" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c6320f561a3cd4184bb5efb02a1558193291fd045f8b50092593f13e0d6c6eb8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.378+9bbfb09fc.tar.xz"
  version "0.13.0-dev.378+9bbfb09fc"
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
