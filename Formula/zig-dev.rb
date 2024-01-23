class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "828052780d4bdfedd899e966fd4b4231d353a87889026165f8ce42b50ab491b5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "64fe678546aa8440b2071220c790461dbeea3df02eb19b5dbe876bee0440d985" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "997a06fdd7e3054fa27de81f7073fdbbf3294b3feab7447f845658f4368e4e33" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2330+9e684e8d1.tar.xz"
  version "0.12.0-dev.2330+9e684e8d1"
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
