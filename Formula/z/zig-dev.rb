class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "15b4b66c22673742a4357625bd8a2668862a5a8eaaa7663761d9fa994e093a6a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "be1c434b9a9d7e8b837d5d2215df7273a1af4febec5e7d4de8dc0ccea96e1ec1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8d9dc98ec1800e3896db76e14fdbf41437d812caea00282a4fa9aa6834afb625" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2034+56996a280.tar.xz"
  version "0.14.0-dev.2034+56996a280"
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
