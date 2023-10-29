class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "672d687e467c574b895d4a193186f19a055cb720feafcfe358e49edc48357614" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2f6d6a005fb331055c20a9f5d339e0306b95e1946799063bfb960d36ef41aa92" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0fc5875415d8556d8468080b6bc3bfe9d4cb7b038675e57d750b3e7f1b7ddf7b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1342+13c7aa5fe.tar.xz"
  version "0.12.0-dev.1342+13c7aa5fe"
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
