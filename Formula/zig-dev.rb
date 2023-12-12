class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9ff00b3e25c397d0592b84dc70044afaf689797fe0e500346154d8b9103cc6a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e72edbecf82ccac17040729762264e0906e8eb0134f9a7abb8e364c8da2b19e0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aa58294498d42009d163150c9c1a3cedc7aa0d198e110e9bc99fafe51ef8700e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1817+f88b52306.tar.xz"
  version "0.12.0-dev.1817+f88b52306"
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
