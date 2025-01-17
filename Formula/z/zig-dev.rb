class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "787f66f87ab50805d5e1c5acdddc2903e0d8ee790278241429d2c67db9e157a5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "57f1aaa90f0914e339973b57ce36b6d479a15e5262876fa3e564790973defdd5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "61e6bbbe88f5347995734ce2f7b477da7b305a601937a370f9ec4a2c254d48c5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2649+77273103a.tar.xz"
  version "0.14.0-dev.2649+77273103a"
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
