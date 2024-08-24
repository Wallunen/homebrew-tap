class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1b0b4b7a380b03433d834181ee1ab336a17207ebf26dbd269fcd0c1783a61308" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0c46c8ce44845ede2fd4477a0513c7f4a49637b2a093dda27ec52e2852cb8b6e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d973b8cfa376d059f346470a58072d1437dae0e09bb435207a87b7b07e968af3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1279+c6286eee4.tar.xz"
  version "0.14.0-dev.1279+c6286eee4"
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
