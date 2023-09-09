class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b884476383b1df72352be99a62728a664b0e37ccd8db3cd64dae56eeaa1eb8db" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "074d8b6dd705ba716d2779435ec35f82496ce78456909072ad8f4efa7970712f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "36849d96d9f029ef626bce994a1be5562ea707f0ba21f7ba4ac799f478a54a77" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.289+b642bb92e.tar.xz"
  version "0.12.0-dev.289+b642bb92e"
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
