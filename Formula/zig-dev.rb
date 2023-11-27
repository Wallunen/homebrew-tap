class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2c65dbf214674765a7d0f0150f385af70368829c41d451d5d5a25a8f4fc7fed3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2abdbc28b7e3085b48af76c905996abb5ff6d777ab0ffc0bbc02622c5cecce2c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "26c70b87b39046ffb8ca5477f318974412fbb2b23929d43f7a996a316e69db4e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1744+f29302f91.tar.xz"
  version "0.12.0-dev.1744+f29302f91"
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
