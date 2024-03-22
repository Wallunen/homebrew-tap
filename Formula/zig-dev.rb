class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cedb3fa4932dcb8aeaa32525dc7bd4a1b684e87e88c8d6fc99518b5ac1bb3947" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b358f50f871d78aae1654c16177ef88e76740df23ba012f617a542b568262712" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b1eba8c80eb9fc6d47c135518a9f8314f6be8f6fba592e5b14f035e619f61011" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3403+b5cef9e8b.tar.xz"
  version "0.12.0-dev.3403+b5cef9e8b"
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
