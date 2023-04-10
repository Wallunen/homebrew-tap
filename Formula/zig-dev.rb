class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a7acfa05368b3db551a86fd3f508caa5513d6caf0c37157896fd426e5df21044" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6bb5d010c32ea422f73f4af0a4a5ff300282a6e2a5ad5b0380495e1d20671bae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ed6f7a5d0156609cf03bfba76e528080607ffb6d5a1ba379e53789273ccfe798" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2470+c22a30ac9.tar.xz"
  version "0.11.0-dev.2470+c22a30ac9"
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
