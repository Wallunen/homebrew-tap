class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "faee62a38f275f5bce0b71b30dfae79d50245f447abab0c0c4e142e7abdfe37b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "19f56746f6390ae0af98a68381ba7c39a046afdcad30e2b46bd3931ee8a96d2e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e47784b33e4b7019f8ff981f56723f8515afcde3f931c9762260425460b0d60c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2248+7cc7ae1fd.tar.xz"
  version "0.14.0-dev.2248+7cc7ae1fd"
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
