class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9948006b22f7f8878883dadb071ad34c3f68bbcb61b0618ada5ab4a8e8e3a470" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a4f31af0126beeca62f77d2f8012d749fbca878ed95997743e1c68032777a71e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4afc93213756dfeece2e1dd1661159e92aa1de2406e50ee660b155b7e908b746" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2643+fb43e91b2.tar.xz"
  version "0.14.0-dev.2643+fb43e91b2"
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
