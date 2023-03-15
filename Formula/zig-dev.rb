class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a2f224aa7c2c598b625410ffbb4ee4df43795e2b92797ba2ef8ad4c10da9eaf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8eed839e024cd60a8e4cc8600f91934132ee9ff416a783106ccd647ec5c0f567" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4d583e21c83a466915ba4d82d11002f1e7029921df369817085a70d996d1cf5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1975+e17998b39.tar.xz"
  version "0.11.0-dev.1975+e17998b39"
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
