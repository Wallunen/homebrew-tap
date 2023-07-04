class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9ec8eb01748ec072867814e64e0a5ce5541a8dc1ab6fed1eed0bdaee6cbd4dd5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8c31aefaa84d8dfb80ed78e5ee8b98b120e21c17f25c06b8291aa07643274333" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1ed0c2e6e2f39b8d6e9163ae205d422a6131e955dae267cb4b49e5e1ca6a6563" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3912+de227ace1.tar.xz"
  version "0.11.0-dev.3912+de227ace1"
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
