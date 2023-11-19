class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7512dc34d10fea702717e46173b3c55396a745e4cde86405975350a1d0a0c434" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8f33d5abce862b05b5c011d309f4f799979d2f1182880020c0758ab5fe14a3b5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e7a4c49faa94ce0e24b73ea6a88978e4be8b3541fbbda8217e7c4bd10f313253" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1645+7b99189f1.tar.xz"
  version "0.12.0-dev.1645+7b99189f1"
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
