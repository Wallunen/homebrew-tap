class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "11f861db54a35a4d56e53e65762fe88e7dea2f376ad7c7d4887a1ac996d2f1c8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "20ab7b5077ce5e4088fff08b60e9c57f287af28011af7260cfd2aa8a6d4c2478" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "00191b03ef7487e92424fbe44ef08ed94c36f2ff0eb3b9b5f86cb5cc5d7988b2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2313+bf7ebfa67.tar.xz"
  version "0.12.0-dev.2313+bf7ebfa67"
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
