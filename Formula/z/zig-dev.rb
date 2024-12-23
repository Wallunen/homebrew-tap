class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "473f1ef279a2f19ca9c84a59392ce34cb09c7451e7cfc72f3254bbbb1a9729b8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "27161ed4ebe524fe8411512ea2bd2ea188e5f0d30b6496bc345b3e9f8cb8d12f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e13ea1555b9a2c63d14914495dfefd26129e3e0c738dece08eab93cba0f65888" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2547+77c63ac36.tar.xz"
  version "0.14.0-dev.2547+77c63ac36"
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
