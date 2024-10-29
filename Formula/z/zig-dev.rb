class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "57b6922e211e194afd6218398f4846d746cac7971d2315d600931b4d28c36baf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f4d679df80633004f7aae82d2e75d93543305bec0e30bc7dc58204f3e4e8c093" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9ca43a57f0dc5c3217136c89c5934d49fad0dcee498054683c4749a25c94c218" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2059+cdd8e82f0.tar.xz"
  version "0.14.0-dev.2059+cdd8e82f0"
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
