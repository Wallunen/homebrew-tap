class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6b2263412919c158cc42e2d6bc67e35a3976434922690e68c0f03b30d47f202c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "833bf4aa13f1e8f4d2237677903256bab8fde8388d4834e8c033754681804d18" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5d460b12a992314b75cb61f437bef867b1f72b89df192791f13afa741baee7f3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.307+7827265ea.tar.xz"
  version "0.12.0-dev.307+7827265ea"
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
