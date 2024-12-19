class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9228b03557699ee1c9c9c8967149632b8dc41dc3888ec4776f7918b277a03c5b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2c08cda25bb6c87683b335c57826d3ffa49ef081dd19c4364c363f1c31ac22b0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "967e32e5fb8c182e815e098915fb0e97342c540b51cdb60203d431df45a28a97" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2534+12d64c456.tar.xz"
  version "0.14.0-dev.2534+12d64c456"
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
