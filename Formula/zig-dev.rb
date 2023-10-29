class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0c14d0033421d5dc21c6065c0fe07ee0e8205205bf36f5ce88530c082b6cc37e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e2c3634562036de529024171af7006d64e716aaa48a3cb4ec97d10dbbd6a17b5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2406c05a8023554efe78e87137be2a7aa1ef0db6110bd81a25f3ed7a1c9b0d44" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1327+256ab68a9.tar.xz"
  version "0.12.0-dev.1327+256ab68a9"
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
