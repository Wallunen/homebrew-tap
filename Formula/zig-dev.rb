class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d5652136e9916658fe7f5f2a7ac8bf5b9578d6ded07fc6b266c39e16e82dd2dd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ce11d828adb2d74cbcc86dc534d87d9029e79d9fb46f2ca93f3490e3463e85de" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "accf61cd5a472273fbe1270faba0636552c033fd607e5662a57e0806a170c59b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2058+04ac028a2.tar.xz"
  version "0.12.0-dev.2058+04ac028a2"
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
