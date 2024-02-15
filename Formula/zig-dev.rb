class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "34201a020947bab20fb596c21cc9c6c596830c42cedb3419465c016249685c4a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8540dc82e7070698ca6e474c8c01c83e57e0c7379483680b0fde07bb68ba4eef" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4c6ec7221d2e40e9af7b4f54ed19609a8483bd15bcddc3ce0e605e3399cb03e2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2755+07c1dd3d1.tar.xz"
  version "0.12.0-dev.2755+07c1dd3d1"
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
