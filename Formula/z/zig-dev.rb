class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5aab59a957eda4e23de19c5a0116a76336869a6d3ee4ad6fe31774845727d58a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "300a7911a0a219cc180e7f6dd38b1d33def1ac84eaa5cd01c315f5e5c19eabf7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3a1fa20be692da0fe0196efa30d73a98fa21e3ad4d12fb8b95944511c6d0ada6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2506+32354d119.tar.xz"
  version "0.14.0-dev.2506+32354d119"
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
