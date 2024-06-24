class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9cd2788613ac601c4b4f99535bf59c7fc91826e576ec25054fd04b13c500f92d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bb5f03a63b896f71e2cf2a482d41797c7b4d182688d8f18c852672360b917a90" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b48c99f4c53ee2bc6adf21f13d2f4ffe7561c0086b2a284d11fff4135b47122a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.117+5f5895626.tar.xz"
  version "0.14.0-dev.117+5f5895626"
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
