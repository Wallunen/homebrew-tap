class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d65663a3a05bcf24a3e3ec2ad00cb72a35415db969f516a6f768310a1c66fdbe" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e01bc1065f655cecc4993c4343395db670ee32fc6ffa18f9a1ef9cf7f31b4c96" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4e7dbeed0432a41f51b1e068aeed635ff5bc957fc27cdf7b9066b6cc47fed081" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.35+e8f28cda9.tar.xz"
  version "0.13.0-dev.35+e8f28cda9"
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
