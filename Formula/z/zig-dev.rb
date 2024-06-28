class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f003f4e0c9d01fe2bbc05c68fd68c7431092041037f43b727242842ad3029c30" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1ac2607fc9d4f9f0b64ff438940793c1082822456ce1cdca45efaaea455bee29" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2ce5555ed36cc70f9153f1a6fdcfaab3ba18489a53889d77509d466af80dad3c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.129+1e3fb4825.tar.xz"
  version "0.14.0-dev.129+1e3fb4825"
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
