class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c7b38d8bd8166e93ed9d9f5a1a75cb0903063891a1f300d912318f428bf68892" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "089bf4c47743c8450951428b77f1ab6164ecd303aee67f3bcbf29d3d7bc6e0d6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ad56f5261b15dad540782298ff9886d9b652fd5a3799fac5ad8e0c1dffe1253d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3631+c4587dc9f.tar.xz"
  version "0.12.0-dev.3631+c4587dc9f"
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
