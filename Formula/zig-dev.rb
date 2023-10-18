class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "27eeed976fbf66d2ed1a43b18f0d0cdbf37ec723378324d8662de57effd1388b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b19e88d167376829482e9ccb485b198db43e631433dd77527e094baf1864f035" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fa53a076480359daea10d2e54580d958d77a5db42f1b5d801a15e613f15d40a2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.985+e44152e25.tar.xz"
  version "0.12.0-dev.985+e44152e25"
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
