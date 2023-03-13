class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "11f45db9bac2a05f16496d70dba5709e9bcac95242a0745422465f3c706b2c1a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "50c1cacae15a93d1fe20552e8e1b15ecf078bd6bd17964008be6d318074a4d6f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5014c59fb541d8f380d1724f224912d013c8cecfbbc8c54da58a99af3b517497" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1932+c93e0d861.tar.xz"
  version "0.11.0-dev.1932+c93e0d861"
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
