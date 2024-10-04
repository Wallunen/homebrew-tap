class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "79d6eb2b836f793a40c9f42a87c793179f50f621f3260747f4292f03d40b197c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a96b3634b10a64042ed95a26c74d87cd87eda8f385be8274fa37285937fc15d7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cdbd28d0000687bfa0eeda0af1d641388c92951b24937fac458145cadbbf17b3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1713+f99097e68.tar.xz"
  version "0.14.0-dev.1713+f99097e68"
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
