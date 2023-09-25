class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "023bbd00d0ccbc3752295c01021e411079b20a60016370412e94a6932db52566" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8736a1e48ed747f18869d7154631746f2e25bec9e9d037221334aa4d00b3edec" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3c0031c1ac2d8496284e3a9f7ccff9a96f213832c51c2636ed8072e56fe8c501" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.564+759b0fe00.tar.xz"
  version "0.12.0-dev.564+759b0fe00"
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
