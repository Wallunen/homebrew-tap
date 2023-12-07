class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "99d3d0fbe2eb9a14206297bc119483d5747e0c803e9142a29f268f5c2dab29f4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e9da2fbfcdf0856bbbbe0283d909c67044a2c2fea54dce38dfe0a5d006b98e12" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9751dd0c326fbdb2ccb8819e49eafd0dd1ddffdf5e0ed2a7139590ef908f0373" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1802+56deb5b05.tar.xz"
  version "0.12.0-dev.1802+56deb5b05"
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
