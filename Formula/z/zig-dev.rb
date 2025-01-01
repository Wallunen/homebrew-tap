class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0da8111f135ac8658b12670016d32a83b7f2168074f607b23ec233892fc0f46d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "87a910ce620d891ada48c219e1578797589efcaa78207f2bca8dece03cb9c92c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7d213a84dd49a9e307268c2bb2426a04cad6a6e86baa35ae8a8488445a3e82bf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2589+0df1f3df2.tar.xz"
  version "0.14.0-dev.2589+0df1f3df2"
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
