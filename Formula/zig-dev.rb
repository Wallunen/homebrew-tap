class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4e66a11e4b1335fd2ea469d5f7fa9b9ab0a1ed8b7e6a7ec549ab4879f4bccd25" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "827f818b36d776ef40dd65151df103412989ad98928ffabc169a1f1208d65af8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d9d72cb57b1c14d4afcc71ca56f1575ebd03ff63a259c947f044faae83ef91be" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1127+32bc07767.tar.xz"
  version "0.12.0-dev.1127+32bc07767"
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
