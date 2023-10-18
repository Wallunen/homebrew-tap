class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a27a527acde935fabe1bf9dbbed3f6251f6cc35065e96b55657f0ad74db6ecd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2cdad5f21a168440a12aced702cafedd4acdc05c0845c99c1ed53e9fe40fc02e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "23b64daa21b4ba9997bbd4c09a809f6d93829fdde61b64fd192ff2367afff612" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1092+68ed78775.tar.xz"
  version "0.12.0-dev.1092+68ed78775"
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
