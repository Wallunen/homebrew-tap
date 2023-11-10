class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c48a9e19ba1afbe0d9cf1d7feb490ef1420f706812e15d191bde5cdfeac122be" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "18e887017097ce907232d956c5baa7265a414f31b78dbcc5ad02ba2600090430" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0c88c1aee50bef76d3900335168d690fae666494fe06c06497fa4d3c75f7f0d8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1533+b2ed2c4d4.tar.xz"
  version "0.12.0-dev.1533+b2ed2c4d4"
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
