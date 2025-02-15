class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1c5a45cb6c0254126a12dca17e80aa817de025d71c22f79f45c814223c858b02" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "97528f51867d2d40c02fd07ca710cfd0e08b0ae18d960c7c3b9c74113c0cda08" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "df6d09f6d87b87ede12805a16c3e048031001c69dafc758cc3ca0cfb00583b0c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3222+8a3aebaee.tar.xz"
  version "0.14.0-dev.3222+8a3aebaee"
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
