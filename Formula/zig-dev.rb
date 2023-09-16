class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "486774fca685791515091a24b0a9b80d29c715dc15a16408161ff1909ed84e0f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "acb2770245077178cdfaa2265f582850a121a205df719fcad6298d861df266ea" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5d654a506f45350edf3404e7bdb46a5f290f5c9eba490a17502857230d0b77d6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.381+1a0e6bcdb.tar.xz"
  version "0.12.0-dev.381+1a0e6bcdb"
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
