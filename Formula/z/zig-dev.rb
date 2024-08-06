class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cd8a984c8b612742a5a9bb24f350b490f0d878a3b54f27e91a3174cd61855bd1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0f6abe625941111637c46f583b8b8e2b5a1334b6987cacbf59f8ad08b7acc468" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eb7df78ae06f75ef9e1752931ebac3d595be0f05de7230656fb451e82727b374" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.850+ddcb7b1c1.tar.xz"
  version "0.14.0-dev.850+ddcb7b1c1"
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
