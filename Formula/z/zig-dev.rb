class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "866401c9622642ea4bf39589fec51ea142c498b6fa76824be2baa9bb183222fe" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a1df53cf81381f93a614144148e6788232d15f6acc396c9b3c31f6e5970202ee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ad04132ca58ed02d4676b7d5c2e73322b3c7b0c31e88397132efdb5c4a076aa1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2424+7cd2c1ce8.tar.xz"
  version "0.14.0-dev.2424+7cd2c1ce8"
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
