class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "db1928ac9057e3b7aed4cbfa3eb868391afc39fea67c1a90fdd8a546e5e8e4d2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "74a67508cae7faf9ea82acc14c550d2b082d1ea74b9b60eec95ce2870a79fc22" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c11ebf8d43338a5e2dbd5065ba27d70bbafc63bb24b1c29634b53615bb276a22" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3303+0103c4bf7.tar.xz"
  version "0.12.0-dev.3303+0103c4bf7"
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
