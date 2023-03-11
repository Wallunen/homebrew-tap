class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "76edaf8131d1b2b1a578e9ffc43f2b3e5f6b8c4932409de34191609ae51b545e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ae8016aa3070be34b8e44ba0fe5fb4eee0801d4b32c915c74c5963a297e7fd9d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e81158b172362f5d3b47d70343b7dce9865951dd00a341b54a5840357db75215" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1922+b445bbfea.tar.xz"
  version "0.11.0-dev.1922+b445bbfea"
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
