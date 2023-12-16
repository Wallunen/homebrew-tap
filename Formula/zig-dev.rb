class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4f02f257cecc0c372273d904ac1d67bf7913094479ee545caec112f0ea9d80ca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "45934206cf27717b1787842846aba45e75bb61e3e4de7b5678fe6749d8d09217" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4ee31e315746f9e08d05207d225340d1fd635ffacc6f8e8478949f36d7be4348" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1829+70664547c.tar.xz"
  version "0.12.0-dev.1829+70664547c"
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
