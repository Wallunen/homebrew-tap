class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e2fda63533bcd4b1f425f40114eeb6c94145257c8d68deb7cbefedca876c2804" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ffa823b3f916ed8493bc7eb588b845c89aa2fe1db5ea8f48ccd3d66b4de3479d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62c3c93101e8e6cae61a6eb3b4541652b47fa34a0f3e6f1df15d88e838acbe0f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2710+c3eb592a3.tar.xz"
  version "0.12.0-dev.2710+c3eb592a3"
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
