class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0b8c8605fe7476ded80b28e0847da6608d96a000fe0db1dbdeaaa9d3dcfb2ee6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "532e5bc9671b15a504fdf8d68d9a4c179dbcf761c4992b90262f75a40d503cae" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d08ecfd39aade1ded838c66ea5e139c11e90980b29a29673e6138b9af7dafd54" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2414+ba37a4369.tar.xz"
  version "0.14.0-dev.2414+ba37a4369"
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
