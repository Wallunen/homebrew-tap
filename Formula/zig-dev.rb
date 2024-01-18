class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4611334769799b60d8f8b4cda06449c323b0d50b1a6d5e99c9dcc4bb9756373e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4cd7a3288ce5803b4ff5e599b4e7dc56dfc422822b4312385a7b4c8e560a6a6b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "587a7a345b6a6190cf02d7adf8a1246c7db02f0803620f711e7ede7a2942bfa4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2261+c4a1b54eb.tar.xz"
  version "0.12.0-dev.2261+c4a1b54eb"
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
