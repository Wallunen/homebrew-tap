class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c384e43ed83bc7c5b4c18e06f44da911ffadd20de92971f6b280b10ffbf5cd6b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3b7a77471fa85d1fe0be8c136d45c0f179603065efb9c7d88557e53992c353da" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "29af14c9e6042ffe16ebe0883a48e4697795dcb89d95399f1a4547cfe1c1ff19" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3674+a0de07760.tar.xz"
  version "0.12.0-dev.3674+a0de07760"
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
