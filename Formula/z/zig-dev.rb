class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9086bb562ad58d6e79be3663fa88a854cbb026dbd157b24c55c10a998528da6b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d04809c2cd7af1ba21e5d131a20d1610558bedc16f9fe1cdb7ea93cac6b3271b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bda5f99e8aa8f0e33e14ffd74154bcc408db8ed1b4727249dd421796ed503ebf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3050+d72f3d353.tar.xz"
  version "0.14.0-dev.3050+d72f3d353"
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
