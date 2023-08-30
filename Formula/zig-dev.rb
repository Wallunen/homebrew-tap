class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "28eb95b615d7661a7058443a5f87e5c89e1876a534ae1f120717d038b75905e3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1235454fa1a2fed7539559cd2b95e1f0ef8963422690800f83b50d310e08945d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "051bc4c22151eeb8e68cca908a3edc764789bb13c8aec70d7cc0d838401522fc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.177+3b2b9fcbc.tar.xz"
  version "0.12.0-dev.177+3b2b9fcbc"
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
