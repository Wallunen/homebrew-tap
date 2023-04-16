class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c4ef49a6e331862c8b0adebe7d62e93a05349772f40af904c33e5d1d779d5557" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dc161ae3cea88b41ebd9a35611383a763197a8b61ca431874ff0798fef479163" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eeaa13f057fc98ef4e4de1f1e1c941761ef6afd1cb698d333277d1c571af5545" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2617+61c08d3c7.tar.xz"
  version "0.11.0-dev.2617+61c08d3c7"
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
