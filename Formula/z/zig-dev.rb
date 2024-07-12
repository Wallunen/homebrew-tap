class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aba0385cba030b18ed1d7f2b5126a90bee9d4da07ad6c039640639c7d7722c9e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6698e5c15f7384ee5c47d549c3ba9cc63d0e1d6b9242be2389073e4d86d39c3e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "91fa3cad1015166dd9b995600c8499175837c5ec4f806a2a7114576a7a2c34ed" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.239+80d7e260d.tar.xz"
  version "0.14.0-dev.239+80d7e260d"
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
