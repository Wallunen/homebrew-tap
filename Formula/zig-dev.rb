class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "db9ddb6a4747ff0d00736f2b3b35a66a78817c11b61490533f0bdb59065a4ceb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "55d6571ea7732675c9da1e9be9286f63ee7288c99efab96d191cbef2dca408e4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dbb1a820cdaec4b31b7aafacf09c10a27d10c2008a5be4a98f4e091bbe52fa2a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.411+ada02ac6f.tar.xz"
  version "0.12.0-dev.411+ada02ac6f"
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
