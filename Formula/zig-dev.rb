class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4eab31e56795e349ba8e67218fb603b358f17995e70c175c7f43b4e63ed84a9d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a3f01be4ea3c1a64e5474bd03d4464911205e45f7fc505f215b56738fbfe61a3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d6b19feb4cab2151ea4ec9565cfc063198b80211e575003e5ace7508c08403e0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1313+8dccd7727.tar.xz"
  version "0.12.0-dev.1313+8dccd7727"
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
