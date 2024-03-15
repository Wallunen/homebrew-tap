class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fb9891e8af0414242b37be725de9ec76754508c578ee226de690ec03cc257940" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f20269bf8cfcef1aaf2f2eb9fba3c4ca0a6e55a283ce96a7a589197d22712d53" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "33060bd0438ff9334bf48797356857d1e56a6a8fa9851a75e20c2d9555214357" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3302+778ab767b.tar.xz"
  version "0.12.0-dev.3302+778ab767b"
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
