class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9223e017858de709f1f6a209b151acb9c18de6b64de8ea50d012e907bcee1906" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "48f8876619cf2bbed3f2a864bd74be790d0367aa54bf45b8a3251a6a36dc7077" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ea85210f228c84e66660069ecb0e4d644b3b64b52c18ed99ba6f7dbddc3a8858" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3217+5b9b5e45c.tar.xz"
  version "0.14.0-dev.3217+5b9b5e45c"
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
