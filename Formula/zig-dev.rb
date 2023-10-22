class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f2415863f54e7a557478dcd21f1d9ed4bd5464c74b89a33f97277fbf987ae92e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b5f4d1c55bdc1f3bedb0c77be5e34507ddfcd85c0b9d36c1b44bd7f42d866715" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6e2b50f1b56213b825690f3db63f62fd5399dad80addb2ff7f9b0482a411bdfc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1168+54a4f24ea.tar.xz"
  version "0.12.0-dev.1168+54a4f24ea"
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
