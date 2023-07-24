class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4acee27fbdba45eb3cc61638debb8abcd82a7a9ab687b8a0481cf279a8048108" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "72e6e5ef2967dd395eae7492d81fb051474727056f07b68e85b6336ee6da2333" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "57c0be5428b627282ad97326f4b519443fb78f3d42918303481a8726d11dfc55" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4203+c57749f5c.tar.xz"
  version "0.11.0-dev.4203+c57749f5c"
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
