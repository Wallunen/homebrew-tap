class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "524e892fed92bd38d3187f970c6337b23a26cbd4835a1f82f415254839ed3595" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "78e022798e4bf8b87a338c15d996d83f1fa6ada0433ecc70a5f84deba1dfebb1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "efdc28a93829ed8819058d3cbd7fcc8cf9559cf9e56487b782e15cb1bfca2562" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2+0884a4341.tar.xz"
  version "0.14.0-dev.2+0884a4341"
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
