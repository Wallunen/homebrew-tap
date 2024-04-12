class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2990c97b9699ad49ebad5e534ecfe5a761175e691c5cc4b304d7a435340f4b1f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8355fee42b7281779a27925862143376d852d4c97a50950ea4e572b33c237d12" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "62833a8ef7b819d4a9c99dc2f331ad7cfcc3a05db7d77ef53feb7fe254c9257b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3634+3d1652070.tar.xz"
  version "0.12.0-dev.3634+3d1652070"
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
