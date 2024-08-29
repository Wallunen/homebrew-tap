class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0cb96bd5bde4958fb4050c084cab3efe3092c1613983d2bfde5116a608c752a5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e1fb60348b204b76a740bf2d57915dcb82a984aca99109de772aa318278bb32e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8d2b3c1240f59520a18fd2f32a6e043bd9049bb05289559fb96af14d424995d5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1343+9a12905a2.tar.xz"
  version "0.14.0-dev.1343+9a12905a2"
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
