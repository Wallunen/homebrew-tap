class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e4d1444a4db3470ec3035bc9611ffcea2159993125815746206a415a13c8f185" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "deda3ab2a437a831136b5090b5e634ddb1385bf217cd801bbeb74b85d7b9a4e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8264307f0f02e66799a7ffa7efe28222a5cba55067a0869d802a7e5ac7016726" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3283+b8920bceb.tar.xz"
  version "0.12.0-dev.3283+b8920bceb"
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
