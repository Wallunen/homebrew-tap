class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5548762000741959c8bc41b643b10c2c2428d2fc35b74efbc0109413e8a312fb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "07125f4770f99f6430acc58bbb55f35dc438535b7060d607a376e037163f1e90" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7b4f400150fb55bdb9ab68369e3d344dfc997dd02a34164afe72bc2a0ec29baa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.154+768b17755.tar.xz"
  version "0.14.0-dev.154+768b17755"
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
