class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a4ea490b2cb90b36a11a3909d613a9a45a43edfb288a5f4f77f8600daa764ac2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0cc04e83ced23e07a614ae6d632edae29c893831fbd43f04710eded47eccee69" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4849d37530ecd0f38afc3b8c2c9b136c309e68dda7100ba38062d830946b51b1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4056+996eb0174.tar.xz"
  version "0.11.0-dev.4056+996eb0174"
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
