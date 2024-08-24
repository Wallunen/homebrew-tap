class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d74b7234bb2335f1255f357e49230e1f0fed12d71a2b6626f8ee2767e9db3ba2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3869236792c1da2d8899aab0932c89a4186c1abe4558d278f2172d07bd17cd10" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d9f12b19174111596bc347a8695e9878cb26613fff8b9a0d121cff8ba56485f9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1290+945fc7064.tar.xz"
  version "0.14.0-dev.1290+945fc7064"
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
