class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f30ce23fb0797bfdc92acae54c8db666415479c81ec1c454a77916477104c61" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5092e391123794cdeb0e8ee9007033873cfb2af26c2456ccf57e583d7cf1c460" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b885459c4d0e5ef369e134fef9a35ffca077f320b0ac8ca1990a240fc826514d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1785+72568c131.tar.xz"
  version "0.12.0-dev.1785+72568c131"
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
