class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2ea28b26f74435fa1d3cbc425e1162ba5d05214c2df722aab1f17347b4549d4e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "85dde124866e7df8a84425df853b64d08bac6ac66be4440314ac84a3b80fc47f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "01dc2007a647e26935f0478224b8b29791e19a72ebb5cd68c0c4bfe1e532bb4a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.93+ccd3cc326.tar.xz"
  version "0.14.0-dev.93+ccd3cc326"
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
