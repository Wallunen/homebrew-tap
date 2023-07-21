class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ca961c22db47746bea4182591d307b604ffef8d8a9fa8dff7e7d36b43a5546d5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f439a89b5f16d91cdf3c48441bcde22083dd2500235cb5c8fdde140a830d7630" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ff759d116cf9757af98e3e0d05fba9ef9e1756cb7e3db6ba72640d56a6cabadf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4059+17255bed4.tar.xz"
  version "0.11.0-dev.4059+17255bed4"
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
