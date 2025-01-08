class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "75d927a6d294b5ced5b78b509b11b61ec8b53dcdb824f5d1f33a9e26f508e07f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c0809c2c28d2521f74737cd5dd2856d6bec84b8d787612d4eb9d029bed6ba043" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5e990e094562d4eb1a05c5abe08b2c9df7436a0d2761ef3ab634844028567dc7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2625+23281704d.tar.xz"
  version "0.14.0-dev.2625+23281704d"
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
