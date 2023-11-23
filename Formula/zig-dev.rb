class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4c15d6cae9bd88bdff0a72a21d882f2eb4b05425d6be8dc3ee1b496357e50cdc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fdf74f01790f4ce68b49d87b8cbbb6c90c698e0ad1dd4a4c076a3c091df4d1a7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "547439dd355c1b6165dd3c21835f2978d4e858e4cdea1e5dc65c61cbc26fb1af" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1695+e4977f3e8.tar.xz"
  version "0.12.0-dev.1695+e4977f3e8"
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
