class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a2607d995a57bd30c01c3784deb783bb09b7b39ead7a361931272a716124c1ac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2b4241e32c9b99fc4eab34f20171a64bc9725e9411588c7c5f45827e57457f6a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "95b314530b6daa6bddb9605ca5d1bc26729d665925f143251df2ff399c44aca5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3316+ec58b475b.tar.xz"
  version "0.11.0-dev.3316+ec58b475b"
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
