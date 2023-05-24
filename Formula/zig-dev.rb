class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "37388c6bd4ab2c933dee220e38163d44198626218c9f10f13d3849d356dea2c5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b0e7e328d597bf5ac3f68d5a66db12d3951b58df69067bc0a2f9a761cede22f2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ccdc1bc913fbc57ec5a6dfff81b891199a6cd8f92b2effe494add087e4187721" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3286+dcc1b4fd1.tar.xz"
  version "0.11.0-dev.3286+dcc1b4fd1"
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
