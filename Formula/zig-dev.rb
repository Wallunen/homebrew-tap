class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f9cf76be50756846aaf8a945344a0d657ef3fe521fc4aba1002e0fb25b251373" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b7da8fff9540bf552c591edaf82d8f67ec814e553abc90052bb520d988ce740f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "997073655d48791b814be0ece16ffae7aca000f60e85e76d96971b0456adaf0d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.41+cd7998096.tar.xz"
  version "0.12.0-dev.41+cd7998096"
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
