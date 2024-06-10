class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5e6542086db25dfc5397244b7546bc173c6c089f511c934236a7e6fe59748baa" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dfb99f84b728889cd98da3dbefaa1933cb188d14d171ca1a79ef5ed6d97affe1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ede945261617d51e8b76a5c43c24abbee3c82f3bdbb980c582bddd9de2df7fd8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.14+ec337051a.tar.xz"
  version "0.14.0-dev.14+ec337051a"
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
