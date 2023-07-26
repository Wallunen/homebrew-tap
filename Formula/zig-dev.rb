class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1501d8abf2d3be860bd89b5426c85128057f4012bbae4c9b5d96f77c1899d412" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8e205139f8e5f0958aa008816cf5fa4bb5ca2e8fa8ea76231aa762fe2dcdcd0f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "97b25e97d0cc3b66111f362b9e1ba7b7fb75a418072ea4887c2271fbdc02f9d7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4246+71dfce31b.tar.xz"
  version "0.11.0-dev.4246+71dfce31b"
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
