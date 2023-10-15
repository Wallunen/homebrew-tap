class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8b51f20d9992f4f6190abcc14e52ae70088f6bf2b043f92604fbc9737994ebfd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "014e6d56aa7b42f778bbbc8e44a0658134393ed6206917a0e5e80b93d0c14e3f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ec350cf85732e3a96e13a32754d90e0136bba75c1c9b1cbd1f923f1578989c38" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.906+2d7d037c4.tar.xz"
  version "0.12.0-dev.906+2d7d037c4"
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
