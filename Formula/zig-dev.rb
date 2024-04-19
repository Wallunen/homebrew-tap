class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d8db55d87caf2fa00261b43a5569566a5d6e77f8eba03bcf04112de6537252aa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1935b1574128588b8e02ed727a71108614da214def246fba9bb2bf63f218fd8e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b1e1296e62bd4e7bd94b571b426cc07d09df1e4f916f3da3c0766f0005de4a02" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3676+21a6a1b0f.tar.xz"
  version "0.12.0-dev.3676+21a6a1b0f"
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
