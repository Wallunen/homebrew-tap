class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "41510b77ee4a5c7c030bb062406d56e99c417f55a34fcebe73989304a50e79e2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "19a6eff1a55da2709a1f305dc81abf38f52d500372ba4a6414b5d8bb85bf76a9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "36f236b32fd020fe13e4e2afcfc209543a4a47b943c452a1ccf7397eb146928f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3437+af0668d6c.tar.xz"
  version "0.12.0-dev.3437+af0668d6c"
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
