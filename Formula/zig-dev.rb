class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bbccc74ae6f449583bd925eb12d1f0525a780b3ab5159799f1f066c4bb323952" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "017be628e6e8ab7c1b9553e4d7bad144f29d92740d548227a68f332bb1ba8042" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "301557a680f750b3d35967c6944dae3a90bc58240ff8a6a40e177dda5632b91d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4296+7e25fb4a4.tar.xz"
  version "0.11.0-dev.4296+7e25fb4a4"
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
