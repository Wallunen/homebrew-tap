class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "306ab461076baa6ee5c7c2ff1e8bbbddd53cab0d2659c518e7db94cb3ae46d69" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dd6d00f6deaa89f56dbd12075eb70c454b8e795dcf4903dd0a0ee0c6d3f3f338" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1871b273f94630c7b1702dfd56b00d1fa79398cf861c439606eba45f870079c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1899+8da6b393f.tar.xz"
  version "0.11.0-dev.1899+8da6b393f"
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
