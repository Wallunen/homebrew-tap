class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d492d7ea7a3f852e6c5c01fdf544d2211e4507deb06b9a48181ad49ad56c131a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0f8a6d288823f8ce9532211b4fa1d43491ca5671a0273b5c0206b33183a9ce98" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0b2c99b03f28fee2850e97854e491d6b6143e27a38b70d4876657a490996545e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2371+c013f45ad.tar.xz"
  version "0.14.0-dev.2371+c013f45ad"
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
