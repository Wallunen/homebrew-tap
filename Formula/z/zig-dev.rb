class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e7bac00412df9006986814912395400900f425eb8b977d8b7d58dd7f49a722c2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe16d239f2fad896a06e5cdbe2574198196944f7034dca7246e8b8675bf55a3f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "adcb52adf3f17ed81a81f471d720d712a7cbf8f0cd9f273766b6793ce7b7216c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1338+93cb44c80.tar.xz"
  version "0.14.0-dev.1338+93cb44c80"
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
