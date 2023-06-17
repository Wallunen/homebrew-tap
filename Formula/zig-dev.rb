class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7866d2d01b5a3e3e02657159680eaffc81db7c9b9dd6494283aa366f7796924" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9809f0cc3ca8b25cab59a48a925576e6caa82b76d9fb5145bc11f69577f3ce90" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "96a1589665b732d118de887d01e7e968c6b76af9f2127357899162d32b9d221e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3654+2d6d2a1d1.tar.xz"
  version "0.11.0-dev.3654+2d6d2a1d1"
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
