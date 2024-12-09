class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8bea876ac472aafd6e39da08d3db0e998d8ccd4237e7af09193342a9b64997c3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d7e229bdd9f31263598e61dcc2f443ebe026d1cfed8981bae4a9c3645920cb2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a9a16cd5b115c26fcb117fdda0bfe3ded7f62e4a8678b88a6fd1a00f8430e633" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2416+a221b2fbf.tar.xz"
  version "0.14.0-dev.2416+a221b2fbf"
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
