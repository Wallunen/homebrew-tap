class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5b96c77420b8e9a25c6769cbd1558bbc7770df9730c87108ade0dbe1a1b314de" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "da89a679728b218dbb49e8f2ef0a16ab44fd15ddf978babcd881aff9adea4d07" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a7c0a421353998a1619ab80c9bbbf4cd57208e63173f74cd3f3a4f15044e6142" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.899+027aabf49.tar.xz"
  version "0.12.0-dev.899+027aabf49"
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
