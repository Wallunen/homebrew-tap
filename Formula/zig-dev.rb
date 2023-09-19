class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5a724cf8b671e7db200dc5e7bc5319e36703a35cacc2e0113eeb7b6c5ff9d2f7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "57681d1cc4fa74cc4b36026b52c199728132d77a0b3599825c24c3f51bf4764a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3a6d93857488df4e3d50227ed652ce8179f28ab77e31bf86bf0da878a17c7c7b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.414+461036069.tar.xz"
  version "0.12.0-dev.414+461036069"
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
