class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ed5b2ab428df5ab6efcf94278f0faff5accca7ec0b9b6133235d825d2c4be237" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e1846615d5bc34a7aea43e0d6129977992ea0fe827bbb3403a11192f7314c2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d68df8dc63018408cc6c0a8d0eb60541d4c339482dfd8cb1d9b678d2a8405b0f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2596+e6879e99e.tar.xz"
  version "0.14.0-dev.2596+e6879e99e"
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
