class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ceb6d4043975ec8a59284aa066a2eb97766e94f6c2e7d5728e7faa6e2225c9b5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6588bc60ee56c41f5b75b48f91834cb2b6d1dd58ffbaba017c2599c0517d3a2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7102be74b06848bd5a7bdb1093dfb4b23a62972754356ec4865051c46b59a08a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2367+aa7d13846.tar.xz"
  version "0.14.0-dev.2367+aa7d13846"
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
