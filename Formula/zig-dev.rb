class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ac5828b154b7fdf2578474af40a4798bf608c2b07cbe670e5fcddb14de1ff163" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "af8615ffe4da653b2c1a0307ca071f97b2c707c5424396e0e0f9a57185d7401b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "36dc56115e80cc80f860f20831e3a9938029a57d6a1b927a7cfb786383ebf50c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3369+c52a2c338.tar.xz"
  version "0.12.0-dev.3369+c52a2c338"
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
