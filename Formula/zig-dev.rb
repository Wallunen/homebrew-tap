class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a4bf1b4f7c9c351729b068cb208325f48b096739eb4213a3b82c4a461fae8b81" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "48391ad8e9f941c35e46f4f6325cdbffafeec132d5e852db4ac5a787124c4f73" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "95de8107d5b3ea2bdd28cae5398cad76020190cb29dc47c5554c9210120b7896" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2550+a65bc8d07.tar.xz"
  version "0.12.0-dev.2550+a65bc8d07"
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
