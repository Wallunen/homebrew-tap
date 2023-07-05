class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d1ab5b25a45c826f3c9f9415119e6ea409143874de0c9a7cf613a3d8c2c9a3ec" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f1b24c55b1acfa427f6641efd616762eceff67373c4fbc2d6f837dc4722064c7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "371f74ac8b556ef5c01e4e7b1c98cf14d61cfe45bec2b29054dc827b0727a654" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3937+78eb3c561.tar.xz"
  version "0.11.0-dev.3937+78eb3c561"
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
