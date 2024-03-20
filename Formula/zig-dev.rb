class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "19d0bb29669b70853af7b9c1ec47f455b7367595a0608df6966b5d4d2534bac0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c63c9f5b6bdff9142f8863a09e77d04d560f4d79b86914a4b387f756f73e4bdc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d3b10c5b27eae97012b80a18be3dbdf1d41ef37381a98493f907d2a8f8ca8efe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3381+7057bffc1.tar.xz"
  version "0.12.0-dev.3381+7057bffc1"
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
