class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c74cd4ebd3d732ca437bcafa553d30322932f05330e0309f64a53f935fc50c63" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9ced40b6a670648904d77c7ffb040cc23c45eb3c5d5bd30e8d1df390d1ada92c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a503186e465c008b491c44d147eae54cc75de8642ea734030c3ea11a4581e2c5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3496+a2df84d0f.tar.xz"
  version "0.12.0-dev.3496+a2df84d0f"
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
