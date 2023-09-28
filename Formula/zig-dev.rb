class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "693f6f08f40a9d0c2e3003ccb2b0e2e262c12c3c7419de074851ba1fbeb13a24" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4399c4abe70792f618c3385f4044e166cdf842957b469f53196d15579df71897" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d5c25aa339e809ed638cfc0e1b4fdae74447f3bfb5fc54020476943a4a185ed7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.616+37398ed2a.tar.xz"
  version "0.12.0-dev.616+37398ed2a"
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
