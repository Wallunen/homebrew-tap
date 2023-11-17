class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f4b597497586b6d43ec390f4fe7a1d83593a407674a6c84a15a78eca15e6fb73" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1414bc9d583102685c71dd060b953c10bc8a4227e399d085631fc47f765398f6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "41a5f7605a13820a6051188456b5579d45317a8d247fc76887adea8997a9276c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1637+673a1efa2.tar.xz"
  version "0.12.0-dev.1637+673a1efa2"
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
