class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bda63b7a8c27955351f80680533b68e5ddd991a0119596ed39b6a7c8e694e886" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8fcfb03f860312d6c4cfc2781d9832e3fef6582cbfbfcd032cfa36e7190edb84" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "11503b69a83cb8ef0870cd29d1cbdf5a23adbc7f06f25d6d2711ef516bb40d7f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1+a327d8b99.tar.xz"
  version "0.12.0-dev.1+a327d8b99"
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
