class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8842b1e51a49ef56cd24d17b87035ed544aa974662f130e8e2702e9c6db4f9d5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c91faed8f7063600521c0847d6f04acc190d98a5fd93bf3c44c62c0eee72bc1a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a95fcb8de7be0159f45e49f42d2f10a3596f2a9c83d86406ede34e297734d93b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2338+9d5a133f1.tar.xz"
  version "0.12.0-dev.2338+9d5a133f1"
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
