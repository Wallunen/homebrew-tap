class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8c65a236af5feba75dfdb43be485230e484e75c493759c89ee8d98c460b301cc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bcba4712d05e3fc72b8c5f68bf922f3a357363603c96e55c4bfa63f25a594f2e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5528f605b5797bc4ef23434237d868e7766cfea04ec8f3a51d7041e9afb1dc81" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3212+40e64245f.tar.xz"
  version "0.12.0-dev.3212+40e64245f"
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
