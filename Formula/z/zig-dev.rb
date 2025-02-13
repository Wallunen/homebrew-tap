class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "739ced620662fb208fccc1e58b4bd37d3bdd75f40c5917d70b85662d99b28fb7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cdc8909f3c7365b5f6cfc77368f866d4758d44a3e2a1443935dfe9a89a030461" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d144364eb5e6dd64b25ce78cfd463b21b53c610612b84030c4c7cedf2ba61cd3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3204+c2a3d8cbb.tar.xz"
  version "0.14.0-dev.3204+c2a3d8cbb"
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
