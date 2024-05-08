class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1910e3a7194ea15c60157f7439bafc7e0ab19352646727ac4592f51f386735de" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "580b39f40fc8924603d41c5a953b2ecfee28a194940e5c2d70833beced7d4862" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "45802544b41cfdcbdfe3d68cf626cf22f0e0368fa3f49aca4de4e7527c4536fe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.74+67455c5e7.tar.xz"
  version "0.13.0-dev.74+67455c5e7"
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
