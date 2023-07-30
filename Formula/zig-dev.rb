class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "521a671bda3a76ae3fd4fbdacfeb7d7d40db8753274bd7928dad9b10ecf5d2c4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "355b3c3462122b93fec0faefa80927268b9f8cd527d44da427650766bf803f29" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "beece2dec2fa03d583772ab940ead4586fea0b0b065ce7b852f0c62cc722116e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4320+6f0a613b6.tar.xz"
  version "0.11.0-dev.4320+6f0a613b6"
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
