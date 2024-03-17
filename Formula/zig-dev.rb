class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9afc726c214e8792f30b8688d0016cd00edfac45f44f5e382fbb9f29b828a3fd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1cc7ecb2667c17cd694c37d916bf3179b096d43d4bbae11af4dca2eab6fd745b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d935a8b7c8c7cf2d6673645428735489ab8834d6d1ef22c940af60700a90a40e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3336+dbb11915b.tar.xz"
  version "0.12.0-dev.3336+dbb11915b"
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
