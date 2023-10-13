class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0e68f8ef59148222860b5048a75efbd3c69996b5af25aca76c358c62c0487650" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3571e1936715d9177cc94e928219a0217f95fb71e35d687fce82080c43083578" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bb72e556bc988c2134b5dab75b680e2f6c61b865b50f3c3b7cafb132b23e3799" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.891+2254882eb.tar.xz"
  version "0.12.0-dev.891+2254882eb"
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
