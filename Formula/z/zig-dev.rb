class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6318c4b5acdc9bd1430b79fbb9c36feaaee0c11079783d95f1f0771648c1b39e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d728959a004eb8f375b51dd22ef42779e501bfccb42b63d5f475bfe6ea49a432" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "269e8cc86ef84352c2e6b0d5b2a3eafaf218838cb63bab612eb7a5f1569683a5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1820+ea527f7a8.tar.xz"
  version "0.14.0-dev.1820+ea527f7a8"
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
