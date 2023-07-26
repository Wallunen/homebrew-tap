class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3b792eafa83fe9be0f3d8bd2ae51ff8e5ff51491d44cb847b0989ef27c5ecd96" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "45c36d984a5ed7cd779717e7883afc6c3abfe3292cda9bd00f0b9ec67b7095ed" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3bc913417b31c21d7731ca09b2fd05e7a79d0ae09d6a51b8b276f4476b0687f5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4234+dc2483516.tar.xz"
  version "0.11.0-dev.4234+dc2483516"
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
