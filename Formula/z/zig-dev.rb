class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9a94f0ebbd7a3a80ebf279e053c54f88e21038f8db2cd41eee948d699ef097b8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "419dff4a5d3f256c314c0e1e50e677789a4bb3dde930375b5ec205d43efd52a1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "871efa14f732b851f2af07bf0bd6078843feb7f807317a9e9b44dab247e5a4ed" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.349+e82f7d380.tar.xz"
  version "0.14.0-dev.349+e82f7d380"
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
