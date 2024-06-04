class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2a4f6b7cc80509185c83af6d7b958ce9139d7a30235b0a776356fc9965416d48" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "22e241e2bb5799026492a710c6e73086f6829ae82490bed80650954f1e0b673a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e48cfda6a5c7f6cbf17b87fcf9a351adac17e036a545f4d33c7128fd311c6b71" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.360+7f6ec51c8.tar.xz"
  version "0.13.0-dev.360+7f6ec51c8"
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
