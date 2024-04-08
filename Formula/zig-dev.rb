class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dad929c9eaef40e0b117b5d76ce9816560486988ca95bffceb8276895bd72cf8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dd440e059c39a8ed0909c6fea94666360389909b4b7c69a2a1b32ff4819c1af3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "92009df51c4d0f519133664ec7b0ba5ad544d172a5291791519e9d6efca1f772" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3580+e204a6edb.tar.xz"
  version "0.12.0-dev.3580+e204a6edb"
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
