class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6474058cd8c5e378e9e57fb8a3c1143dd93b2ee55d4110bddf698e18b0dc0c8a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5d2f59fa7c47c3d81f323a6591acabdb193236f34cfc41e21d90b48879b0f7bd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "34cca11e5ad8e50831b03e5f360f4680e277a5ae8c09fae3e4c16719fba6187e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4321+235e6ac05.tar.xz"
  version "0.11.0-dev.4321+235e6ac05"
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
