class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7b7b75bd73fbda49be7fdf388c25c374f475b7c2acbed73da53844b20cbd1979" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43d543c0bcb24d2f8fa3112f100606a42f60deeb2d0beb4db737979f7a54f3ca" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bc86df4f572c566d682fa6e3d436575ff5f2e15c97ad574d7ff3f12ba728a006" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.311+c50f30038.tar.xz"
  version "0.14.0-dev.311+c50f30038"
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
