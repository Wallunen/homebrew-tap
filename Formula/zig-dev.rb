class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c47db3167959e9bff48d9be9cacd9400adc5f02deed668c0f61472a5492ce28e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ea2a72401bc1a32ab4e127cfd17c9fe8a457cdc6f4860d6196a8842d9f1511bf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "10c7e16859c19627907bde5f665b97265441de56faf086e2a3a68ed7c7204b67" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3986+e05c242cd.tar.xz"
  version "0.11.0-dev.3986+e05c242cd"
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
