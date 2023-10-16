class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "48b554fcf635c1b08f173cf918a9088dc44d5e3c0fee5b5140568cb1006aa589" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "56cb9f7c5872f1fb61cd7090ec90eb962b199ccadcde46d778effb659759d832" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "33734042e447fc43ddcfe195664602d44688666d8d1a6ba483aec4b24bdb49d3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.934+a241cf90d.tar.xz"
  version "0.12.0-dev.934+a241cf90d"
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
