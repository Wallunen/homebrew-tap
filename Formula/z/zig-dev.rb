class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "04716cb658ff60e22273045c6144e232bb5ef40cc592e5c2f9bf470d312b537a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "502e95cef3bbdd822fb3a7cbcdfc0a9823cbbe4b191bb30860ac29dee9022f2f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e863418ac2c49aca2d961d23365540d17dd5a365dcf96f2d6fb22956337eb8eb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1038+87ec4e11c.tar.xz"
  version "0.14.0-dev.1038+87ec4e11c"
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
