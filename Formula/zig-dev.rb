class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0c89e5d934ecbf9f4d2dea6e3b8dfcc548a3d4184a856178b3db74e361031a2b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3943612c560dd066fba5698968317a146a0f585f6cdaa1e7c1df86685c7c4eaf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1b1c115c4ccbdc215cc3b07833c7957336d9f5fff816f97e5cafee556a9d8be8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3886+0c1bfe271.tar.xz"
  version "0.11.0-dev.3886+0c1bfe271"
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
