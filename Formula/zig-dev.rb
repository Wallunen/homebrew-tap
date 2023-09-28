class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0dce613504ad793e6622abbd775e57ffa73d11334efaa8422eb9dcbdd58c27de" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6f3c40d76fc82c1b12eb052f1c67a1ff16f17eec372422dbfb0e0d401149e959" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fd356fffcb6469ee1b594c09aa42ea10aff46fd0124927665d8fb0746e4638a3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.629+1606717b5.tar.xz"
  version "0.12.0-dev.629+1606717b5"
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
