class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "85cd51dc6c5c92e5a4cf4867e98ee64f950fffcb3663b865e6f5f4ba14b1eb92" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ea4358fd353d2578644eebcfa88feae5068af4c2d5f87f738b3381ed4bd6a297" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "afd21d2cfd3953ef65934b757962574042b57b20d4c979d004f9a2dc41aad3e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3041+8e9c9f6fd.tar.xz"
  version "0.11.0-dev.3041+8e9c9f6fd"
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
