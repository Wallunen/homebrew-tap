class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b42a524202a81166d623717596ffa47d5caa18ee1efc59a5a40f0da253e8648" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "00675c4f53a04a88503b9e67c438bae1349324fdffa392ca25f4dfad7d107199" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0e96b554aafea13dff5d62a0bdc340ecfe4c62d32c3832ea943d781e4381fd3a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.15+d4bc64038.tar.xz"
  version "0.14.0-dev.15+d4bc64038"
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
