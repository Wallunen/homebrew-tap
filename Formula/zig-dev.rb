class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5537d1cb44f047564fd067829db49b9ebede4423b7d7b428613c99d23e5de034" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "38a3b29921f86ddc6f1e47ff75a1ef662010ee5cf0b23c6c4cbd5504b91acceb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e0c16cdc8b75fa9d9c25333ae5a3816284ce154967617ba2150500adf67ae0c9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2700+d12c8db64.tar.xz"
  version "0.12.0-dev.2700+d12c8db64"
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
