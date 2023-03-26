class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5e62935b3c65a0c3c4d7d12027656504a91062bf38084aa32777ae26db60fef3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9273a03c97a8e737fd8d0e521955a920817c771510709aed122da9e8af0f896a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "194156b001ea66af84628bd2eb27fa0c307ac2baa370b5b3c1517be9f4be0e99" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2266+49e33a2f2.tar.xz"
  version "0.11.0-dev.2266+49e33a2f2"
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
