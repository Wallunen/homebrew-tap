class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "89fa3a68e6f3b5d0d6b78611721d2b07e1fc176b2381a6b3dcbd4dd040223dcd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e2d2104b8f4f63d5c5f30cf768b50aad7a290be9f9dd77f3ee8f3e5b0c76ad06" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8ac298b13de8fc8b3221432df0bb8a032465b6a195634e3500cc2440abca2abf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1769+bf5ab5451.tar.xz"
  version "0.12.0-dev.1769+bf5ab5451"
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
