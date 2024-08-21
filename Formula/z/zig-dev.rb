class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "08d3fe54ce6eb20704cd45535e639149b1007c3014ffb56189398deb387c2a2a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e3c0deecf75b84e9b2584153c2f477b9c29ded8bac4d3473a2dc9da98b948c66" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9a3fca35bc34ce5ce37e12453a02c8cbb681b1440539ed48857d8043ffbb3bc2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1224+16d74809d.tar.xz"
  version "0.14.0-dev.1224+16d74809d"
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
