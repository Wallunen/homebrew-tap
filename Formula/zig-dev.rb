class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c93c61c17aa18b53a004611a31aad43fdf575c1182f83066fc017f81cc0d0c43" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "71e32294bc0c5f3321105a988a7eb50bd573ec2ca9af8a90ab0c8e91fc1faa9b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8106749d345fc2fd43a479423c0a75af3061e2d98f7aba7fa3082455f74d6fc3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3936+8ae92fd17.tar.xz"
  version "0.11.0-dev.3936+8ae92fd17"
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
