class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5fa52f13dd76c687325be831eb824a4974f129e5db7ec3f9d3b4ae5f205c5a05" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "89950fb0090bb3f7ff05b3692520642e32d8ee1355e45864bb8b16d49a0008c3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8206aec0691e9932dc11fb9e09f18a6ad3d049d24964d8d7501bb2b5d4de2be6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.15+1c7798a3c.tar.xz"
  version "0.12.0-dev.15+1c7798a3c"
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
