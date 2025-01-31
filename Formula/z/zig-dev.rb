class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4835d31a21594e324df18b360d6baacd6775424ed6a79602bb76de10f187b11c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3e077f0dae77ed0e8c8bd2bc568ae048d9726a3ea3c96698bba6b7deb0a1cd60" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "76a96b4f0779fc551c556c3687510d5e786f5ae5e9f2c0eba2747d59f7694a10" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3008+7cef585f5.tar.xz"
  version "0.14.0-dev.3008+7cef585f5"
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
