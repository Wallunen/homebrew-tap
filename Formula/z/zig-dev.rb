class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aa1a2f0b969889ae84dcd3c5c492c732911744e1e66f37444820fe352d03fda5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e7acfba40e6e9a72b5c148b9bd10b6a9f2e21fb290ed072f7010454cd7e66c9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "68a495fca5d902f9a44e02780ab16a5c1204e1e68c0db48b9f5fb287963b332b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1200+104553714.tar.xz"
  version "0.14.0-dev.1200+104553714"
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
