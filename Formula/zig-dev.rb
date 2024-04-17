class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "09e55e52e61efc576657794ef7a369cded4b3e17e93ef6e18d97d31a3954e9ae" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b994a37ea0215fd2880a5fabe9b4a137266f93152888fb6ae400381f8fa6b54a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "220335781d31de1a38e7b650dd13121f8974808876faa246b750e1352960b9e8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3666+a2b834e8c.tar.xz"
  version "0.12.0-dev.3666+a2b834e8c"
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
