class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a8e7b6d19abe1c06e5ea857125938703aec8a75b45275db200f09a9b9fb7637d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "96bb3428faa2d6d8bb5dd61815cab8d7cdc99cb4b38e0b55e7aa4fa9786588aa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a22e2ec288c3769978bebeae7ccb248ee14d7616e44269c31b66093ba95bb23b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2196+bc0f24691.tar.xz"
  version "0.11.0-dev.2196+bc0f24691"
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
