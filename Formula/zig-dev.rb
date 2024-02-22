class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "efe930a9b0765655f5dfc9592fea73bc512888734607686bc9bb1ed3a407714d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "85fef6c6bd4f169a0883b4b39896236d37d1957e7ee65eb8a6849387dcb9febd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5f9415bd4a6419245be36888b825683f001cdb2d6ad08c60dac85b0a1f39d5aa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2824+0b7af2563.tar.xz"
  version "0.12.0-dev.2824+0b7af2563"
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
