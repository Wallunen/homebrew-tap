class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a23c927ec9a9cf9ef9d83561551ba7fa2046076b2f9813e8bfad9a5b80589bac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ff66079cbb860bc7db1339097be33fdb42a6f088a741557ceae23dafcb9d56ee" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f24000d71c08d14fd8a32a43f34b420c837147b58569dc95a1cc9d17707178e1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1753+a98d4a66e.tar.xz"
  version "0.12.0-dev.1753+a98d4a66e"
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
