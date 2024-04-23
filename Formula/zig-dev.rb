class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7c4903e0fbf4b96228e03546b416ee51d2c9e6d738e22f55b800f31ae12290c8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a37443f956f1d35543b194bcd56dcf78760d0e5a9fc5bb0ee62143e51222d500" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c825f5364b12879519bb6a1f721b2d471bfa634806d3686e8a77e38a834f629d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.30+6fd09f8d2.tar.xz"
  version "0.13.0-dev.30+6fd09f8d2"
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
