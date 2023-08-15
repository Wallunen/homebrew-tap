class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c04d884eddab3b7ded2e1ae9179dba3552a75347f00c0f482a470ebb16694436" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "348d787df5e33c5fb0e3726e546c298fe8ee1d8d9dfd18ea6720ed44747d3db0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "175aa06510c299d54ce79ae6e99c22ecca1b4ae93f5b1a079e5fb44762e9300c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.86+197d9a9eb.tar.xz"
  version "0.12.0-dev.86+197d9a9eb"
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
