class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "70f5129061343842c00e54dc4f6118e216257eb02e1662a0e7cc0c094a9eacf1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a12c252d49d5d770271daab19856a3b6a014b17d2ef1551164ebf98a63f4d34c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4d5d993d6391ae9aefc3b36bb3c20017653d6fc6ef8403c0d456c532db86ab8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1510+fb0028a0d.tar.xz"
  version "0.14.0-dev.1510+fb0028a0d"
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
