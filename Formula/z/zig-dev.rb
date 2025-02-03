class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5d82aba58eff4221f736bdcfb009df4be186d221532e25cc2380ed41f9aca77f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ea5b85f82fe22d81dc0d2f2f78f59999418e13ac0fb4d2a5fcfc7be1a979cb80" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "be42d581bf49c51319183440d252f6a76c070b9d798cc80bcca930e269d49c5a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3028+cdc9d65b0.tar.xz"
  version "0.14.0-dev.3028+cdc9d65b0"
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
