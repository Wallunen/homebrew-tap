class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "45bd1343fbc17d93673dee6645142b388a2b0776ae18643e41c958a281792e2b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "67ebec65bd49aa62abc60238a63a3f753dc0a506e1334f67de8d4f8a7d42dbb6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9aca07d899b3711fe06a3ed79e2b6c6e5a319f66d400c574c897e9754b5d9e0b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2837+f38d7a92c.tar.xz"
  version "0.14.0-dev.2837+f38d7a92c"
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
