class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "35dc916c2833fb16593179fa1e6d2a09e00b1fdb5967fad67afe572d932af0e8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0737aa74e1ce81dda13e5144ffc97575406fa28ec8dde71853f25232ca932a0d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "39e3e2698f829c105492265dc2ead1a98ec1f2dc8c4015e8bf4accfeadc64b39" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1033+25096ed89.tar.xz"
  version "0.14.0-dev.1033+25096ed89"
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
