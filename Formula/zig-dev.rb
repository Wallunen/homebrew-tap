class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "29daa147630c1361daa2963c3fcf71e9755705f0d7ceda32670db3289d038755" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b275f6dfcbeb17c451a863752c04a7d15d8fe0bb6380aad1b6a1c779dbecb80d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3614cde220d7b7a911c8edb4f94f1e2bfc796d65a059c92faea3c8b89fde70e5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1150+3c22cecee.tar.xz"
  version "0.12.0-dev.1150+3c22cecee"
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
