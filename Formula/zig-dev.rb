class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e6342eb4d0ca9d46c01fa748a6c5da6b31ead079df7cf14c580eab7cd4a69704" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "47488f184ab336695c10b03313cddb82289bcccfcf6c8a4be80156a2b42ec742" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7351d2c922673523bc6ebcd499cee2cb80743cd81c7336f67209c989ab65904d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3890+43c98dc11.tar.xz"
  version "0.11.0-dev.3890+43c98dc11"
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
