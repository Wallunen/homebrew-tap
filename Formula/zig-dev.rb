class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a9816fe4fa7ead3af72fbfa4d3f5f7c04d35cecbdf9b4f63b94dc3a724b7e443" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2c078330c12471a5f9145be0160e0a91c1c11030c0321477d0f5e440335e5ed0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c582c28302a088afdf6f0b2d69a7e7c549cb0477e050f7add444095f11532c79" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1606+569182dbb.tar.xz"
  version "0.12.0-dev.1606+569182dbb"
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
