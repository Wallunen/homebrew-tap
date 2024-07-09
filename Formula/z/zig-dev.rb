class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "226b5822e61e730ddb9c14d62b4578c24d150c9ecbb31343b76aed6b72164157" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "963efeef58932b0d61d99d8e7e7fed041ca11ee286ff2b4a774d121f57e3e0f9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9148429b33f722c2fdcd30bd975e0c832524505be04da7724f3093e5a35a17d7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.208+854e86c56.tar.xz"
  version "0.14.0-dev.208+854e86c56"
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
