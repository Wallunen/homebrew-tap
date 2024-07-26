class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "af62ef7bf6f1ff1dbf26404fb2f98b852b8f9181b7d0758e9a051069bc3c2d85" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c238a5f1defe08347c068a095e8258a49546adb35cc03e8e17d2a466a77453e3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cb9a8eb76bc266977df5fd28038a6b7d6a24fe7742086154c48620351547a21c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.577+3344ed8b8.tar.xz"
  version "0.14.0-dev.577+3344ed8b8"
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
