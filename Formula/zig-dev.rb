class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "46b7e4bbb4985a5a80e2f599fb81390e8c7b1f485efd849631d0d6144c254511" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6a4a39725dae569c5d6001fe2fd318a7537e1c205b197f7fbb9b22ff5da6150a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e500b689fd078ca510d07ce412cf2bb821051d0d894c353e9434dfa0599b8dfa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2938+e963793e3.tar.xz"
  version "0.11.0-dev.2938+e963793e3"
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
