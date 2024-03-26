class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e38dbd4483575243a6e7d79bca0c3923f8528fb40e67042d9b4510d2cfdfc3a4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e2f209293fc6ea292020755ec1c066f85f1deee893cebf26a07f2b5c290f86a1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "25351f4a1c8da8e296cc8c41add242f17df680ddcc4cf82931c40db3d2c899ac" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3438+5c628312b.tar.xz"
  version "0.12.0-dev.3438+5c628312b"
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
