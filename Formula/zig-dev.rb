class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "18e8ebf3aef80553541f6ba1489a54bbbaf7a2a68464ef132e104f1a08f5fdbd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d3351d657a4fd2dbdaa39423002b9ce65897f9565b068405532cfce8a71fcde2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3f59cd2cfa92800e1435a1716ca13768aeef1a91c192993d9a47efb1fc5e738c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1825+25b83188d.tar.xz"
  version "0.11.0-dev.1825+25b83188d"
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
