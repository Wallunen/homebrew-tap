class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7720d5268462ef7bbfe7053a557c864a22952a13cd46f0cf3012b798f51f6e0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2b4ad86742ad79834d1846a010cef06e2450abc4b123b352d218a33949274feb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "181d245fd27ac11705a826e4fdddf5dd05f1e3c40afd2df4a4946b6f391f002d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1743+eb363bf84.tar.xz"
  version "0.14.0-dev.1743+eb363bf84"
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
