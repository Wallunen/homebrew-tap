class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3278bfe260848a39ece4175383992d82eb7082b0a713da09e8e062171e09f6c2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e808946792c65d3749288575d7f06df1a046dd7f239e7181d046a80e0092f463" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7c14d2734d0d4b4613dc9f95cfffef4251cec03aadbdb4e0475ca337708e92a1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3290+b9cca3b63.tar.xz"
  version "0.12.0-dev.3290+b9cca3b63"
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
