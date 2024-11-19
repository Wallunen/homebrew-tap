class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "40be12de7da2854bc437e145f6628e6bb3b93687ffa60053384ad4d7fcd7313a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8ce5fc271099ce2426401d1c0a63cb25e7da9c929fa23b2c61fb6533d9942975" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8fe874f4f72f2deac4136e8473ffb01b012ebee3cff0fa9223f03ef80db02e2e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2254+73f2671c7.tar.xz"
  version "0.14.0-dev.2254+73f2671c7"
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
