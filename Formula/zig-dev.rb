class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f95d948768a6484373d53f839f9e2517896024d175becfc37d5262e89a4cb9c8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "871dd3e31d4268438637dd52a7f6858c589d1687cc7664a81698c7a7c274b53d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "99e4d90ef744c1a73e0149957daf959b092737d11d75eeaf02af32f712c2d597" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3644+05d975576.tar.xz"
  version "0.12.0-dev.3644+05d975576"
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
