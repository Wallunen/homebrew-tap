class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b8c3d4dfc8169a98467450e7dfeb288ae1be10f9ecf0ea4044b60df92210bcb4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "04d14db7b6c8dc613ed89d5c88d765de4068b428909445ae121d99e3a8cfcfe6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4c8338efb69512e8f9a08790b3adf8f63068bfdb008b544168e7c9633da89b7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1647+325e0f5f0.tar.xz"
  version "0.12.0-dev.1647+325e0f5f0"
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
