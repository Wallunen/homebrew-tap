class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c110f196977d50ed0ce8adf83c34e42d9095b40e5e5e8f8281570c94404fc921" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f2d669805535ad3106eba2d9c027c2885b90b8290877779fa07ca68ee1222995" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6d8e075211c05394d2e0e3e872a377b81deb65cf4056e0ab0ba073a01a33bb39" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3905+309aacfc8.tar.xz"
  version "0.11.0-dev.3905+309aacfc8"
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
