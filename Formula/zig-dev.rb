class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d44c81fe6824c3d9db9b640fe81d526e7a0329c3c5794de0401cececbe167777" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "da162637ae9c17f6a877a61a7d7035aa2d72f84840477336c45aed9d7f866a1f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d3dfa862b28de5e5e9638b386a841d9e201f3930329100c3b3dc9faaed8fc75" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.294+4d1432299.tar.xz"
  version "0.12.0-dev.294+4d1432299"
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
