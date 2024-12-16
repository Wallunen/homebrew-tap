class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "82e44d44fdcf6e6f49b244f11cdc7f6ca51d727e5923eb863a41554c9937b22f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c5b1c9427c5624023fa0c3fc37ffb231764df92e30f490524aea621c8d19a7b4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "204680d7d59f8c2e07342c326e4d8b33c95f31cb5f57435e6c3a12c07087a868" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2487+af89bb05d.tar.xz"
  version "0.14.0-dev.2487+af89bb05d"
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
