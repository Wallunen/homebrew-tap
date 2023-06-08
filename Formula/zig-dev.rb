class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c1f86b3675931c30f6bfe2a74611507a6ded5468976d1b377fc15476483f2bcb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8fb8ee6b492edf938f1919243c04375bb00fbb52f8377cd5c9c7e65c5ac2bd9c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d67712674c2a3fd11e9a554a1dc0c762ee0c2ff2b5535763af923b827c1a6cb5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3383+cb7040154.tar.xz"
  version "0.11.0-dev.3383+cb7040154"
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
