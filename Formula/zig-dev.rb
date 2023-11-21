class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9deab5b6d91bab8f15cf7af4d9a0fea8505bff0e7a0f54ea50ad4fdb65e6d980" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0b74f1dbbef0bfb4684a214e427769fa2455b5d06176f1a24e1b3131e98e285a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c373c009dcf6a1d551b262d3950b49fff557fa53adbacf66e68054ff4df863e0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1664+8ca4a5240.tar.xz"
  version "0.12.0-dev.1664+8ca4a5240"
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
