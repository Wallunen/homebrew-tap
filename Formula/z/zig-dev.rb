class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5192484c25ed0d1b7cbdafdf19c269b4fdaf5b6135628a7028f7423ae9ada732" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cbaa8ae3dc0e7743d5f81337bfc06bd4c230348023c118a60d40d742912b480b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3eec467a13530cec27ef896925b18d093cac858ba7ca61e7f7be36a08ebf3af8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2162+3054486d1.tar.xz"
  version "0.14.0-dev.2162+3054486d1"
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
