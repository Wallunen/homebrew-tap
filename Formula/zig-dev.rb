class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7e92ab3e10cab2800f7279eb2c6c4aee1ab1bf74a17c2f8f3d8072ef3133306" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "454ff8bb0b539770e6134652f6b40f1e41e1459da49869679ce01007ca1a5119" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "193e08e40a70baa6d69ccbf62791efe61c703cc48f9e2ab0a3573ea7b6f06d72" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2825+dd1fc1cb8.tar.xz"
  version "0.12.0-dev.2825+dd1fc1cb8"
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
