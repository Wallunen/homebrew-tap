class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c74c1dad10fe785449e5f72ae16cf98496974ef91ae772e7df922af817353e08" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9569b4ce940c541683c83a2bdc28112aebebf5ee7c114db4528babb3aef5b12b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "703bb2bb86c1aca32afc50104449528522496f2e7261344a574af9801e668f96" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3964+3d5751b57.tar.xz"
  version "0.11.0-dev.3964+3d5751b57"
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
