class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f303a492fb3e2efa27f8e0d40418d3c6a2d13b5a6e436c51376a08870c9a010c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ff90449dcb8acb9fe42f165c847eee7bcf05a2735a1d98f0c35a4c98499c225f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9e76e5caced0c211b4cfa547763c9c8739e7de81132704b9acca4e9e07f1c165" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4297+e682d6eb2.tar.xz"
  version "0.11.0-dev.4297+e682d6eb2"
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
