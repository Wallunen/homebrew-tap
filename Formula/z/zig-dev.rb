class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "673439791e0473c34a7cf405ce2b03ea8a21748ab4bf464ddd765eafd45802dc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7ec392c82fd9ff9f9f5220c8632ee72e77d513743b39cc650440aa35ec6970cc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "65d215cc3a11de016b438c4de6d74244a125a5adb886ef911ed3335dcfc413d7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2245+4fc295dc0.tar.xz"
  version "0.14.0-dev.2245+4fc295dc0"
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
