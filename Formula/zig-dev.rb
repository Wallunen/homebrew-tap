class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1c91d9962c135f694639ca69eed9f63b605c093a9b26978bdf093333dfc14bb0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f9f9adf74c1c034cde9d1e13f4813f20691e825b1702e74f9d71d05fa3daa007" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b9b8140e4441ad531bc2693e473d192b8e7c6cbc02a8b2dd28e8413cba624049" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.344+b2588de6c.tar.xz"
  version "0.13.0-dev.344+b2588de6c"
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
