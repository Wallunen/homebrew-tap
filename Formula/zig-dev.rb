class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f52f6c1ab73e2c33f6d84dbb9d3b5677328bc1ef7065c05e902a7d25270cc6a8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d57201d625dafebe192c6c6986ba095c6f96f5edaa293dc78bc97943c32dc74e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0fb5542d243cc7a35ee42b1310a0fbb70d9c1d397eab273f4c7fb721705f70ce" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1607+f8b38a174.tar.xz"
  version "0.12.0-dev.1607+f8b38a174"
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
