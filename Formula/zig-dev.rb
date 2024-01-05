class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "79b2bc968f934b014ffd44dd1bc0cf4706ada7ecb29aa84523bf231d328f24c7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1ccccda3d6fc3329270931df9dae9338510826d3ef86c17a3faecfa2d8f72cc7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e90cb82c71fc479128c82b42adf68069922bc847163bba4113f6a2f31af50da5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2036+fc79b22a9.tar.xz"
  version "0.12.0-dev.2036+fc79b22a9"
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
