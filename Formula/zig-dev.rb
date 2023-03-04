class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9406add431c0580d916e676f72ab734a4a634f2170e07bd76ab902da6754aa4b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "78684f3789dd59ebb95d76e0f51703b0cfbb25b1efeeb558514f2ce9c4e5f5d8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "89853f6be3b5265b9ce4e51ebf8d825f4cda4047fcb268e82ada23b609fd4ae0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1842+6be5946ed.tar.xz"
  version "0.11.0-dev.1842+6be5946ed"
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
