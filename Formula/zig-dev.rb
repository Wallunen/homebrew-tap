class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e4043212441f1a56fb3e54f638a94a0983881d27316cc5f5e6d42a14fce87532" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c09b7024329986e839f829b4cbb7a3d45ade4548d1e6d606cebc56f60c199841" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7c142250331e81c9b4f814b47a2ba0f085d1bde6b93fcac7f4a64a0079f70305" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.297+d2014fe97.tar.xz"
  version "0.12.0-dev.297+d2014fe97"
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
