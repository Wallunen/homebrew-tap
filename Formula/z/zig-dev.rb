class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "41dcbdfb5dec4f9e8d8466b5f4bef9405a2ea82dd614bf4a5f80c434367ce9d6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "75a5b763788e697b4a8b171b3dfedbb0224814bf3fb88b47c0f08e1fbdfffe84" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2ccee51dba1cd0cddbb72c67a932ec584d5272eeca6dbbdb905c546e33da3bdb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.119+e73ae94b3.tar.xz"
  version "0.14.0-dev.119+e73ae94b3"
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
