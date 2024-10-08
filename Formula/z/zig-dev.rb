class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "71f55cf095c3e63931afc8a94ce983de173d9f5009be24712be2961f1b0c09ce" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e4c49e54652d6df96d813cc7b437e28db8eda1b4213013f67c0dc0d1fa980743" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe2fdb719a179a647eb81fee78f2eac2409ca38f2ce6b91ed8b062631de82a7a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1816+20e03beae.tar.xz"
  version "0.14.0-dev.1816+20e03beae"
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
