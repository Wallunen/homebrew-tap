class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c82856cb811846c70040cbae29684d6fe658ece6f3d0a3182b5466aac6edadaf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a61fb14473220d2366b0999b0771b955bfbe156a82815ec58a88ebb1c0e27097" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0d47e021d29a5703544eccd090177ce2518fc5d57b06df2e304571f7996d45ef" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2967+b643c5dc9.tar.xz"
  version "0.11.0-dev.2967+b643c5dc9"
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
