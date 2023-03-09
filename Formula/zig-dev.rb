class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "40bfa26fd352b2d481cc3953008eb8a551eff63292ab8cd3b702f8535fda6e1c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "45626e527981d6531cb03ff8ca0253098445f6699aefa09cf3d6347e1a73b1ef" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f35b546393b82589c097b6134e6d6b1287b7787b72a7212f5b369962c1f960b0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1905+e3cf9d165.tar.xz"
  version "0.11.0-dev.1905+e3cf9d165"
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
