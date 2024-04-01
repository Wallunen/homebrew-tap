class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "63e9b5f1db5c78489a8fa39b1085ee1a6ab14bed0387dd2e61ba1152695aef88" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3f3ac9d13333a047c104589e88f0b55ff4592d6214f1477595c2d0e3d8fefe3f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c7a69ec922fcea9fbe92cf41c3bc2bb5ea939faf559766667bde06d40afb82a3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3508+a6ed3e6d2.tar.xz"
  version "0.12.0-dev.3508+a6ed3e6d2"
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
