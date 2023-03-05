class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "274510a486259de58ff0fabd2cf73786975eeec9afa6124b02eeac27609515e6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6c3cb94abca2d743b7ef1879a6ce526d3e509cbbeacd7dbddd8e89ee063330dc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9b925ef92e5405b68b07f7fa56b8e12db55937bfac26947472ef8c2b5447816a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1857+010596c93.tar.xz"
  version "0.11.0-dev.1857+010596c93"
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
