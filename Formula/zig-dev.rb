class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "be29f26f5d0530aa944acd73b1dd1e3189e511f34910465640fdabbc4755644e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a6e9218623ed10458a2de41752dc41cb6cf8ac2bef5aa7ccf76fec710686d887" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "16dc00a0716b3b6d4ea7b78b29a1bb2c235c63db6ebb4deb4b86e631efbdf4a7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.349+4918c2ce2.tar.xz"
  version "0.13.0-dev.349+4918c2ce2"
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
