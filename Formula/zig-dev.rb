class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3387e6629f9b9ce0e7b199fdaa698c4c2d1d946ed435199f4e9ef402a774f271" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8c16616b64c8da4d387c86539dbb1514b58209dc3879013994faebeb47ba478c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9d25fdb2a063244f1ac0147a73232c9b13464a1c8511b36e4895099297e5a3e7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4410+76f7b40e1.tar.xz"
  version "0.11.0-dev.4410+76f7b40e1"
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
