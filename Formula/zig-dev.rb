class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9976ee23fada67036ad91ea27229d06368cac1f97433d2f35a31374b87ea279f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b44ff892844c3d7ebaf3d578e6d0d0ddb9e44c2ec6f4fc5945f4166de8116645" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b72efda4e39a0d227d4f866bd705c4d6fb4c3193f39d8d4eba802250a2bd6c73" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3678+f043071cd.tar.xz"
  version "0.11.0-dev.3678+f043071cd"
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
