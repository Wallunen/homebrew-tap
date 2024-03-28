class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "68d9c4fbd5bf4a536f4bc004c3bd4d03f799c926758bbede09af86a4db287451" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "10216c1b377c00ef17cfbf2163ea7f32c824d459081adda055d4c5d76d0c54ee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f8f13317a869ce1ae82868c20e032d204747d8fecd9da41b486324bf3ab52fab" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3457+341857e5c.tar.xz"
  version "0.12.0-dev.3457+341857e5c"
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
