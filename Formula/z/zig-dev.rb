class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4ce7ace934ebf7198b26215bb6c4ec4db52a946004dadf017ed1dd101d12b1ff" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "88a9ed3e28b89dc79f2e9c6d74e94720aa4e002c54710c0b3230c5aca5e6b08f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1ef191a4eef1e17284d596c38ae4f6e797c1d33635f61086caca322dde3fb136" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1587+feaee2ba1.tar.xz"
  version "0.14.0-dev.1587+feaee2ba1"
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
