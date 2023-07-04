class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e4ae60c08d2d507a1d46768d570822e8c7a947c10d642962a3fa90e1b8db2ca7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "82c87f823490bbbec0a3ebd6dcd43bd2d94601ab9fb6e25295278c492f0331fb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2377e06c53011124bc6b7a2a1c24d4cbde1611f2ac8e9ff3848fb4108bcdbcbd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3932+17890f6b8.tar.xz"
  version "0.11.0-dev.3932+17890f6b8"
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
