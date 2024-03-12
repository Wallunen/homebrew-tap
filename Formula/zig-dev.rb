class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "013b3a96991504ceb57d294b66e00279eeac2de5a7c65d3953c6cbbed94c87bd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3bfebb553fb43071fe0c8a473258d200226f128618c5c8992ed50142d9b6061d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d0361027d2c7d39bb0262dccb066781f833adb349009224b523ee9b8977d03a6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3239+d0c06ca71.tar.xz"
  version "0.12.0-dev.3239+d0c06ca71"
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
