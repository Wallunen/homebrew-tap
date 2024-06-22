class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "82bb20eab66bc64ff366bff096566ab8d30c92315ac995ce1e8bfdaab5765194" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "80658654e6a5e36f2449cd7fe7c2108da7d4c27287c50ee762d8c2a576530afa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d24c0c8d6924e0c36271d4159a38ff5f394f2ffc371b6a1ba68222314369c076" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.112+9be9b8ca9.tar.xz"
  version "0.14.0-dev.112+9be9b8ca9"
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
