class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "781e4f61f2de016b66ba17aaed5a56643bf5c9288d946de2c47ce5bdb829721b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "19f9115410a6dfb004c65d63ffecf947efc595d08977906f73a90d7b2de0b3dc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fdc3adf212d3ed790ea8b44293256324a90ebb5ba9647c01f4d435e2cf49dbd7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3312+ab37ab33c.tar.xz"
  version "0.11.0-dev.3312+ab37ab33c"
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
