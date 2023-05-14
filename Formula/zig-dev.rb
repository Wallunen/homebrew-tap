class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "79cc6d34bc282b2a5f63c4fa07076a3beb9e2108a26193324bcb10fa4456a51a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1312ef8a49168e756c1de6a59e3f385a1d0384347c7b05c1eb0e1b5e0fca808a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9089c3c0cb8bdaed6bc1b275bbc3549d36c297f4c10db37115a53927f66290fe" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3123+6f418c11e.tar.xz"
  version "0.11.0-dev.3123+6f418c11e"
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
