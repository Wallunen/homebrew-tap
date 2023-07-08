class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8e7a5ac109b40f32f6081c82d29aedb1a63a3858529194ac27e1beab82127e5d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "637824501bf5fca86689b0216dbb8d0e3fc83195b84e32191ec21d98d7f4ba59" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a13eb17593908351ced8267135050cf47e6dfc65be11d13830779727f0bc6816" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3946+b9fc0d290.tar.xz"
  version "0.11.0-dev.3946+b9fc0d290"
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
