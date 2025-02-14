class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d4a13cc0e0e7c75812abf9821e8d1698d61d23a136a254383f91b649a338d634" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c4f6a9d345fed9c07c336714437ee047299e8d417d7d7f8020becfecccbb85b2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "700e6c50b8c65e869a18df731a4a2627910094edc9fcae6ffbf5a154472d984c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3219+bffbc918e.tar.xz"
  version "0.14.0-dev.3219+bffbc918e"
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
