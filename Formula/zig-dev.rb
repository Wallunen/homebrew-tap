class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a5264a2f80de9f48d7275ee42f348b56ff5a6e699eabdc15d0afd2131a138e56" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18b3d39ae9649ca94bae59fb563680585bafce1a7b5a4e9d5d334da4bcaabca4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "390d785c501943b76e86cb27e6e865fb4b3b9e75c6dfd293478428771a9bc2da" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1486+234693bcb.tar.xz"
  version "0.12.0-dev.1486+234693bcb"
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
