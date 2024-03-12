class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "494cb301579d5d8bd4709fd05cafd7f99c6ba166be1a00f0565370f9f6acc763" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "be85290af00b389aaa7c3dfdd80134498d73fca3a001980065bd3fe5b16b7291" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2da60d5a9fe396c8225631d3e19e476fea69f56877d938ba41860f8f5be45b49" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3245+4f782d1e8.tar.xz"
  version "0.12.0-dev.3245+4f782d1e8"
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
