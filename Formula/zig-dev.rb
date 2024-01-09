class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3f49dc37ea662b719d41852c0474e1b3ca4656ed79b6aa3b831665d2338cd05b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5087749fda64222f04767085b674da85a41b3f46938b0a265059b31ec0d9e0b1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1e0174342390db3bd96b206b8453777f9ed1bd35d66231a7b47da902c6c4a980" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2075+f5978181e.tar.xz"
  version "0.12.0-dev.2075+f5978181e"
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
