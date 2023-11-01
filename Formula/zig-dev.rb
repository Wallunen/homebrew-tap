class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "47cade7bacaa0c6b8d517e6515b59bcc21bb9fdb3157844dfe938b389025165f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2592b34323f021757989332f6e3cdcc181fa093cdc10aac46c78f57f8ef80563" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ae898cb14e9c95e1f6a97723403a684c45bc0c81cfe5266ae576ed94653280aa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1372+8457439a8.tar.xz"
  version "0.12.0-dev.1372+8457439a8"
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
