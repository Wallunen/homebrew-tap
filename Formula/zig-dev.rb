class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3ca8d53ba0b25eb73a9c56abd7494e0c2fd5c2279efec242666a046cd369a257" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "56f4823c6c1adad790fe481ccf254d5c5d9bfa25120e46d90e3fe7ee40d80ad8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9b2980e4003310981eb7108e657583d0102a19cc5cb58af63ec2ca810b1331ad" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4263+f821543e4.tar.xz"
  version "0.11.0-dev.4263+f821543e4"
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
